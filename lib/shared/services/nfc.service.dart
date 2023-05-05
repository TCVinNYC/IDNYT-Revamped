import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NFCService {
  final nfcManager = NfcManager.instance;
  NFCService();

  Future<String> readNFC(
      ValueNotifier<bool> reading, ValueNotifier<String> nfcData) async {
    reading.value = true;
    final completer = Completer<String>();

    nfcManager.startSession(
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
        nfcManager.stopSession();
        reading.value = false;

        // Complete the completer with the nfcData value
        completer.complete(nfcData.value);

        // Reset nfcData value after using it
        nfcData.value = '';
      },
      onError: (error) async {
        debugPrint('Error reading NFC tag: $error');

        // Stop the session and update the reading value
        nfcManager.stopSession();
        reading.value = false;

        // Complete the completer with an error
        completer.completeError(error);
      },
      pollingOptions: {
        NfcPollingOption.iso14443,
        NfcPollingOption.iso15693,
      },
    );

    return completer.future;
  }

  Future<bool> checkNfcAvailability() async {
    bool isAvailable = false;
    try {
      isAvailable = await nfcManager.isAvailable();
    } catch (e) {
      debugPrint("Error checking NFC availability: $e");
      await nfcManager.stopSession();
      debugPrint("Stopped Session");
    }
    return isAvailable;
  }
}
