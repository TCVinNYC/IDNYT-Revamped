import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/shared/services/nfc.service.dart';

final nfcProvider = Provider<NFCService>((ref) {
  return NFCService();
});
