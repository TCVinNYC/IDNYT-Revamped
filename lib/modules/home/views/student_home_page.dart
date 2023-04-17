// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:idnyt_revamped/main.dart';
import 'package:idnyt_revamped/routing/app_router.gr.dart';
import 'package:idnyt_revamped/shared/models/user.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'dart:typed_data';
import 'package:nfc_manager/nfc_manager.dart';

@RoutePage(name: 'StudentHomePage')
class StudentHomePage extends HookConsumerWidget {
  UserModel userData;
  int _counter = 0;
  bool listenerRunning = false;
  bool writeCounterOnNextContact = false;
  StudentHomePage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(25),
            child: _getNfcWidgets(),
          ),
        ),
      ),
    );
  }

  Widget _getNfcWidgets() {
    if (isNfcAvalible) {
      //For ios always false, for android true if running
      final nfcRunning = Platform.isAndroid && listenerRunning;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: nfcRunning ? null : _listenForNFCEvents,
            child: Text(Platform.isAndroid
                ? listenerRunning
                    ? 'NFC is running'
                    : 'Start NFC listener'
                : 'Read from tag'),
          ),
          ElevatedButton(
            onPressed: writeCounterOnNextContact
                ? null
                : () {
                    useState(() {
                      writeCounterOnNextContact = true;
                    });

                    if (Platform.isAndroid) {
                      debugPrint('Approach phone with tag');
                    }
                    //Writing a requires to read the tag first, on android this call might do nothing as the listner is already running
                    _listenForNFCEvents();
                  },
            child: Text(writeCounterOnNextContact
                ? 'Waiting for tag to write'
                : 'Write to tag'),
          ),
        ],
      );
    } else {
      if (Platform.isIOS) {
        //Ios doesnt allow the user to turn of NFC at all,  if its not avalible it means its not build in
        return const Text("Your device doesn't support NFC");
      } else {
        //Android phones can turn of NFC in the settings
        return const Text(
            "Your device doesn't support NFC or it's turned off in the system settings");
      }
    }
  }

  Future<void> _listenForNFCEvents() async {
    //Always run this for ios but only once for android
    if (Platform.isAndroid && listenerRunning == false || Platform.isIOS) {
      //Android supports reading nfc in the background, starting it one time is all we need
      if (Platform.isAndroid) {
        debugPrint(
          'NFC listener running in background now, approach tag(s)',
        );
        //Update button states
        useState(() {
          listenerRunning = true;
        });
      }

      NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          bool succses = false;
          //Try to convert the raw tag data to NDEF
          final ndefTag = Ndef.from(tag);
          //If the data could be converted we will get an object
          if (ndefTag != null) {
            // If we want to write the current counter vlaue we will replace the current content on the tag
            if (writeCounterOnNextContact) {
              //Ensure the write flag is off again
              useState(() {
                writeCounterOnNextContact = false;
              });
              //Create a 1Well known tag with en as language code and 0x02 encoding for UTF8
              final ndefRecord = NdefRecord.createText(_counter.toString());
              //Create a new ndef message with a single record
              final ndefMessage = NdefMessage([ndefRecord]);
              //Write it to the tag, tag must still be "connected" to the device
              try {
                //Any existing content will be overrwirten
                await ndefTag.write(ndefMessage);
                debugPrint('Counter written to tag');
                succses = true;
              } catch (e) {
                debugPrint("Writting failed, press 'Write to tag' again");
              }
            }
            //The NDEF Message was already parsed, if any
            else if (ndefTag.cachedMessage != null) {
              var ndefMessage = ndefTag.cachedMessage!;
              //Each NDEF message can have multiple records, we will use the first one in our example
              if (ndefMessage.records.isNotEmpty &&
                  ndefMessage.records.first.typeNameFormat ==
                      NdefTypeNameFormat.nfcWellknown) {
                //If the first record exists as 1:Well-Known we consider this tag as having a value for us
                final wellKnownRecord = ndefMessage.records.first;

                ///Payload for a 1:Well Known text has the following format:
                ///[Encoding flag 0x02 is UTF8][ISO language code like en][content]
                if (wellKnownRecord.payload.first == 0x02) {
                  //Now we know the encoding is UTF8 and we can skip the first byte
                  final languageCodeAndContentBytes =
                      wellKnownRecord.payload.skip(1).toList();
                  //Note that the language code can be encoded in ASCI, if you need it be carfully with the endoding
                  final languageCodeAndContentText =
                      utf8.decode(languageCodeAndContentBytes);
                  //Cutting of the language code
                  final payload = languageCodeAndContentText.substring(2);
                  //Parsing the content to int
                  final storedCounters = int.tryParse(payload);
                  if (storedCounters != null) {
                    succses = true;
                    debugPrint('Counter restored from tag');
                    useState(() {
                      _counter = storedCounters;
                    });
                  }
                }
              }
            }
          }
          //Due to the way ios handles nfc we need to stop after each tag
          if (Platform.isIOS) {
            NfcManager.instance.stopSession();
          }
          if (succses == false) {
            debugPrint(
              'Tag was not valid',
            );
          }
        },
        // Required for iOS to define what type of tags should be noticed
        pollingOptions: {
          NfcPollingOption.iso14443,
          NfcPollingOption.iso15693,
        },
      );
    }
  }
}
