// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:idnyt_revamped/main.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/models/user.model.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'dart:typed_data';
import 'package:nfc_manager/nfc_manager.dart';

@RoutePage(name: 'StudentHomePage')
class StudentHomePage extends HookConsumerWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nfcAvailable = useState(false);
    final reading = useState(false);
    final writing = useState(false);
    final nfcData = useState('');

    useEffect(() {
      _checkNfcAvailability().then((available) {
        nfcAvailable.value = available;
      });
    }, const []);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!nfcAvailable.value) ...[
            Text("NFC not available"),
          ] else ...[
            ElevatedButton(
              onPressed:
                  reading.value ? null : () => _readNFC(reading, nfcData),
              child: Text(reading.value ? "Reading..." : "Read NFC"),
            ),
            ElevatedButton(
              onPressed: writing.value ? null : () => _writeNFC(writing),
              child: Text(writing.value ? "Writing..." : "Write NFC"),
            ),
            Text('NFC Data: ${nfcData.value}'),
          ],
        ],
      ),
    );
  }

  Future<bool> _checkNfcAvailability() async {
    bool isAvailable = false;
    try {
      isAvailable = await NfcManager.instance.isAvailable();
    } catch (e) {
      print("Error checking NFC availability: $e");
    }
    return isAvailable;
  }

  Future<void> _readNFC(
      ValueNotifier<bool> reading, ValueNotifier<String> nfcData) async {
    reading.value = true;

    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        final ndefTag = Ndef.from(tag);
        if (ndefTag != null && ndefTag.cachedMessage != null) {
          final message = ndefTag.cachedMessage!;
          if (message.records.isNotEmpty) {
            final record = message.records.first;
            if (record.typeNameFormat == NdefTypeNameFormat.nfcWellknown) {
              if (record.payload.first == 0x02) {
                final languageCodeAndContentBytes =
                    record.payload.skip(1).toList();
                final languageCodeAndContentText =
                    utf8.decode(languageCodeAndContentBytes);
                final payload = languageCodeAndContentText.substring(2);
                nfcData.value = payload;
              }
            }
          }
        }
        NfcManager.instance.stopSession();
        reading.value = false;
      },
      pollingOptions: {
        NfcPollingOption.iso14443,
        NfcPollingOption.iso15693,
      },
    );
  }

  Future<void> _writeNFC(ValueNotifier<bool> writing) async {
    writing.value = true;

    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        final ndefTag = Ndef.from(tag);
        if (ndefTag != null) {
          final ndefRecord = NdefRecord.createText('Sample Text');
          final ndefMessage = NdefMessage([ndefRecord]);
          try {
            await ndefTag.write(ndefMessage);
            debugPrint('Data written to tag');
          } catch (e) {
            debugPrint("Writing failed, press 'Write NFC' again");
          }
        }
        NfcManager.instance.stopSession();
        writing.value = false;
      },
      pollingOptions: {
        NfcPollingOption.iso14443,
        NfcPollingOption.iso15693,
      },
    );
  }
}
