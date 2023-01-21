library session_storage;

import 'package:session_storage/session_storage_generic.dart'
    if (dart.library.html) 'package:session_storage/session_storage_web.dart'
    as interop;

/// An abstraction over [Map] that allows for SessionStorage to be used on
/// non-web platforms without issues.
class SessionStorage implements Map<String, String> {
  /// Constructs a SessionStorage.
  SessionStorage({
    this.prefix = '',
  });

  static final Map<String, String> _instance = interop.sessionStorage;

  /// Can be set in order to prefix all keys.
  /// Defaults to empty string `''`.
  ///
  /// Implemented as `'$prefix$key'`
  final String prefix;

  /// Prefixes [key] with [prefix].
  String prefixAdd(String key) => '$prefix$key';

  /// Removes the [prefix] from a given [key].
  String prefixRemove(String key) =>
      prefix.isEmpty ? key : key.replaceAll(RegExp('^$prefix'), '');

  @override
  String? operator [](Object? key) =>
      key == null ? null : _instance[prefixAdd(key as String)];

  @override
  void operator []=(String key, String value) =>
      _instance[prefixAdd(key)] = value;

  @override
  void addAll(Map<String, String> other) => _instance
      .addAll(other.map((key, value) => MapEntry(prefixAdd(key), value)));

  @override
  void addEntries(Iterable<MapEntry<String, String>> newEntries) =>
      _instance.addEntries(
        newEntries.map((e) => MapEntry(prefixAdd(e.key), e.value)),
      );

  @override
  Map<RK, RV> cast<RK, RV>() => _instance.cast();

  @override
  void clear() => _instance.clear();

  @override
  bool containsKey(Object? key) =>
      key != null && _instance.containsKey(prefixAdd(key as String));

  @override
  bool containsValue(Object? value) => _instance.containsValue(value);

  @override
  Iterable<MapEntry<String, String>> get entries => _instance.entries;

  @override
  void forEach(void Function(String key, String value) action) =>
      _instance.forEach(action);

  /// The [forEach] but with [prefix] removed from [keys].
  void forEachRaw(void Function(String key, String value) action) =>
      _instance.forEach((key, value) => action(prefixRemove(key), value));

  @override
  bool get isEmpty => _instance.isEmpty;

  @override
  bool get isNotEmpty => _instance.isNotEmpty;

  @override
  Iterable<String> get keys => _instance.keys;

  /// The [keys] without [prefix].
  Iterable<String> get keysRaw => _instance.keys.map(prefixRemove);

  @override
  int get length => _instance.length;

  @override
  Map<K2, V2> map<K2, V2>(
    MapEntry<K2, V2> Function(String key, String value) convert,
  ) =>
      _instance.map(convert);

  /// The [map] but with [prefix] removed from [keys].
  Map<K2, V2> mapRaw<K2, V2>(
    MapEntry<K2, V2> Function(String key, String value) convert,
  ) =>
      _instance.map((key, value) => convert(prefixRemove(key), value));

  @override
  String putIfAbsent(String key, String Function() ifAbsent) =>
      _instance.putIfAbsent(prefixAdd(key), ifAbsent);

  @override
  String? remove(Object? key) =>
      key == null ? null : _instance.remove(prefixAdd(key as String));

  @override
  void removeWhere(bool Function(String key, String value) test) =>
      _instance.removeWhere(test);

  /// The [removeWhereRaw] but with [prefix] removed from [keys].
  void removeWhereRaw(bool Function(String key, String value) test) =>
      _instance.removeWhere((key, value) => test(prefixRemove(key), value));

  @override
  String update(
    String key,
    String Function(String value) update, {
    String Function()? ifAbsent,
  }) =>
      _instance.update(prefixAdd(key), update, ifAbsent: ifAbsent);

  @override
  void updateAll(String Function(String key, String value) update) =>
      _instance.updateAll(update);

  /// The [updateAll] but with [prefix] removed from [keys].
  void updateAllRaw(String Function(String key, String value) update) =>
      _instance.updateAll((key, value) => update(prefixRemove(key), value));

  @override
  Iterable<String> get values => _instance.values;
}
