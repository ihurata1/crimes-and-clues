import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

class AppHive {
  static final AppHive _singleton = AppHive._internal();
  String? _deviceId;

  Future<String> get deviceGUID async {
    if (_deviceId != null) return _deviceId!;
    Box deviceGuidBox = await Hive.openBox("deviceGUID");
    String? guid = deviceGuidBox.get("guid");
    if (guid == null) {
      _deviceId = const Uuid().v4();
      deviceGuidBox.put("guid", AppHive()._deviceId);
    } else {
      _deviceId = guid;
    }
    return _deviceId!;
  }

  factory AppHive() {
    return _singleton;
  }

  static initialize() async {
    // Hive.registerAdapter(ProductsResponeBMAdapter());
    await Hive.initFlutter();
  }

  AppHive._internal();

  // Future<Box<ProductsResponeBM>> get cartBox async => await Hive.openBox("cart");
}
