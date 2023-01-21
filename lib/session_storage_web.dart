// ignore: avoid_web_libraries_in_flutter, this is meant to be web only.
import 'dart:html';

import 'package:session_storage/session_storage_interface.dart';

/// The implementation of session_storage for web platform.
class SessionStorageWeb extends SessionStorageInterface {
  @override
  Future<String?> read(String key) async {
    try {
      final prefixedKey = prefixKey(key);
      final hasKey = window.sessionStorage.containsKey(prefixedKey);

      if (!hasKey) return null;

      return window.sessionStorage[prefixedKey];
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> write(String key, String value) async {
    window.sessionStorage.update(
      key,
      (_) => value,
      ifAbsent: () => value,
    );
  }
}
