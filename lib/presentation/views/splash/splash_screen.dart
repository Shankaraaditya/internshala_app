// presentation/views/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internshala_app/routes/app_routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Get.offNamed(AppRoutes.home);
    });

    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/logo.svg',
              height: 50,
              width: 50,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    "assets/trust.svg",
                    height: Adaptive.w(
                      7.2,
                    ),
                    width: Adaptive.w(
                      7.2,
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    child: Text(
                        textAlign: TextAlign.center,
                        "Trusted by over 21 Million College students & Graduates",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}