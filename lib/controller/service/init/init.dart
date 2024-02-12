import 'package:postmo/controller/service/dio/secure_storage.dart';
import 'package:postmo/controller/service/locator/service_locator.dart';

init() async {
  await SecureStorage.initSharedPref();
  setup();
}
