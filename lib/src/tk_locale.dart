import 'package:firebase_database/firebase_database.dart';
// import 'package:tklogger/tk_logger.dart';
import 'package:locale_plus/locale_plus.dart';

class TKLocale {
  static final TKLocale _singleton = TKLocale._internal();
  TKLocale._internal();
  factory TKLocale() {
    return _singleton;
  }

  bool? _usesMetricSystem;

  static initialize({required String appShort, required FirebaseDatabase firebaseDatabase}) async {
    _singleton._usesMetricSystem = await LocalePlus().usesMetricSystem() ?? true;
  }

  static bool get usesMetric {
    assert(_singleton._usesMetricSystem != null, 'TKLocale not correctly initialzed');
    return _singleton._usesMetricSystem!;
  }

  static bool get usesImperial {
    assert(_singleton._usesMetricSystem != null, 'TKLocale not correctly initialzed');
    return !_singleton._usesMetricSystem!;
  }
}
