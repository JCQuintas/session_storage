// ignore: avoid_web_libraries_in_flutter, this is meant to be web only.
import 'dart:html';

/// The session storage for web.
final Map<String, String> sessionStorage = window.sessionStorage;
