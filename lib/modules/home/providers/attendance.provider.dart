import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final showTimeProvider =
    StateProvider.family<bool, UniqueKey>((ref, key) => false);
