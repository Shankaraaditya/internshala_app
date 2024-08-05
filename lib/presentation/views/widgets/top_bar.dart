
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala_app/app/config/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class TopBar extends StatelessWidget {
   TopBar({super.key,required this.totalInternships});
   int? totalInternships;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              // Navigate to filters page
              // context.push('/filters');
              Get.toNamed('/filters');
            },
            borderRadius: BorderRadius.circular(20),
            child: Ink(
              width: Adaptive.w(23),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.filter_alt_outlined,
                    color: AppColors.primaryColor,
                  ),
                  Text(
                    'Filters',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${totalInternships} total internships',
            style: TextStyle(
              fontSize: 12.5,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
