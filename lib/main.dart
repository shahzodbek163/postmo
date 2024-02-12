import 'package:flutter/material.dart';
import 'package:postmo/app.dart';
import 'package:postmo/controller/service/init/init.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}
