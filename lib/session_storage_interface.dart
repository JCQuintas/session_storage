/// The interface used to implement session_storage.
abstract class SessionStorageInterface {
  /// Constructs a SessionStorageInterface.
  const SessionStorageInterface({
    this.prefix = '',
  });

  /// Can be set in order to prefix all keys.
  /// Defaults to empty string `''`.
  ///
  /// Implemented as `'$prefix$key'`
  final String prefix;

  /// Prefixes [key] with [prefix].
  String prefixKey(String key) => '$prefix$key';

  /// Reads a value from storage for [key].
  /// Returns null if not found.
  Future<String?> read(String key) async {
    throw _NotImplementedError('read');
  }

  /// Writes a string [value] to storage at [key].
  Future<void> write(String key, String value) async {
    throw _NotImplementedError('write');
  }

  /// Deletes the value associated with [key] from storage.
  Future<void> delete(String key) async {
    throw _NotImplementedError('delete');
  }

  /// Deletes all values from store.
  Future<void> clear() async {
    throw _NotImplementedError('clear');
  }
}

class _NotImplementedError extends Error {
  _NotImplementedError(this.methodName) : super();

  final String methodName;

  @override
  String toString() {
    return 'SessionStorageInterface.$methodName not implemented.';
  }
}
