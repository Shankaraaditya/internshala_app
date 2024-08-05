import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala_app/app/services/local_storage.dart';
import 'package:internshala_app/app/util/dependency.dart';
import 'package:internshala_app/presentation/app.dart';


void main() async {
  DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  print('starting services...');
  await initServices();
  runApp(
  //   DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => App(),
  // ),
    const App()
    
    );
}

initServices() async {
  await Get.putAsync(() => LocalStorageService().init());
}
