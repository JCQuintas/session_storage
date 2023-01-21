library session_storage;

import 'package:session_storage/session_storage_generic.dart'
    if (dart.library.html) 'package:session_storage/session_storage_web.dart'
    as interop;

/// An abstraction over [Map] that allows for SessionStorage to be used on
/// non-web platforms without issues.
class SessionStorage implements Map<String, String> {
  static final Map<String, String> _instance = interop.sessionStorage;

  @override
  String? operator [](Object? key) =>
      key == null ? null : _instance[key as String];

  @override
  void operator []=(String key, String value) => _instance[key] = value;

  @override
  void addAll(Map<String, String> other) => _instance.addAll(other);

  @override
  void addEntries(Iterable<MapEntry<String, String>> newEntries) =>
      _instance.addEntries(newEntries);

  @override
  Map<RK, RV> cast<RK, RV>() => _instance.cast<RK, RV>();

  @override
  void clear() => _instance.clear();

  @override
  bool containsKey(Object? key) =>
      key != null && _instance.containsKey(key as String);

  @override
  bool containsValue(Object? value) => _instance.containsValue(value);

  @override
  Iterable<MapEntry<String, String>> get entries => _instance.entries;

  @override
  void forEach(void Function(String key, String value) action) =>
      _instance.forEach(action);

  @override
  bool get isEmpty => _instance.isEmpty;

  @override
  bool get isNotEmpty => _instance.isNotEmpty;

  @override
  Iterable<String> get keys => _instance.keys;

  @override
  int get length => _instance.length;

  @override
  Map<K2, V2> map<K2, V2>(
    MapEntry<K2, V2> Function(String key, String value) convert,
  ) =>
      _instance.map<K2, V2>(convert);

  @override
  String putIfAbsent(String key, String Function() ifAbsent) =>
      _instance.putIfAbsent(key, ifAbsent);

  @override
  String? remove(Object? key) =>
      key == null ? null : _instance.remove(key as String);

  @override
  void removeWhere(bool Function(String key, String value) test) =>
      _instance.removeWhere(test);

  @override
  String update(
    String key,
    String Function(String value) update, {
    String Function()? ifAbsent,
  }) =>
      _instance.update(key, update, ifAbsent: ifAbsent);

  @override
  void updateAll(String Function(String key, String value) update) =>
      _instance.updateAll(update);

  @override
  Iterable<String> get values => _instance.values;
}
