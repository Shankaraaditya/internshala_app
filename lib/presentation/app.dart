import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala_app/presentation/controllers/home/home_binding.dart';
import 'package:internshala_app/presentation/views/splash/splash_screen.dart';
import 'package:internshala_app/routes/app_routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) =>
            ResponsiveSizer(builder: (context, orientation, ScreenType) {
              return GetMaterialApp(
                getPages: AppRoutes.routes,
                initialRoute: "/",
                initialBinding: HomeBinding(),
                home: SplashScreen(),
              );
            }));
  }
}
