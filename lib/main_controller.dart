import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yugiohgalaxy/app.dart';

Future<void> initApp(String flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _defineEnvFileFromFlavor(flavor: flavor);

  //crashlytics
  //validate if is in debug mode

  runApp(const ProviderScope(child: App()));
}

dynamic _defineEnvFileFromFlavor({String? flavor}) async {
  if (flavor == 'prod') {
    await dotenv.load(fileName: 'env');
  } else {
    await dotenv.load(fileName: 'env.$flavor');
  }
}
