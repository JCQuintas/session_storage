# session_storage

[![Pub](https://img.shields.io/pub/v/session_storage.svg)](https://pub.dartlang.org/packages/session_storage)

## Getting Started

This is a very simple abstraction over a Map to allow usage of SessionStorage on any platform, but specifically intended to interact with window.sessionStorage on web without breaking other platforms.

### Programmatically

Install the library using your preferred method.

```bash
flutter pub add session_storage
```

Then use the library, the `SessionStorage` class only exposes a single constructor, and it always shares the same static instance.

```dart
import 'package:session_storage/session_storage.dart';

final session = SessionStorage();

// Use it like you would any other Map.
session['language'] = 'english';

// Sessions are shared, so by calling the constructor again
// you will still have any value you previously set.
final newSession = SessionStorage();

newSession['language'] == 'english' // true
```
