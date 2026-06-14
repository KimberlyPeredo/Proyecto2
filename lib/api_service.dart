import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class ApiConfig {
  static String get baseUrl {
    if (kIsWeb) return "http://localhost:8000/api";
    // Si estás en emulador Android, 10.0.2.2 es tu puerta de enlace
    if (Platform.isAndroid) return "http://10.0.2.2:8000/api";
    // Si ejecutas en Windows o iOS
    return "http://127.0.0.1:8000/api";
  }
}