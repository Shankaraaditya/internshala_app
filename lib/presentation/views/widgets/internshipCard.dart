import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internshala_app/app/config/app_colors.dart';
import 'package:internshala_app/data/models/internship_model.dart';

// ignore: must_be_immutable

class InternshipCard extends StatelessWidget {
  final Internship internship;

  InternshipCard({Key? key, required this.internship}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    return _buildContent();
  }

  Widget _buildContent() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey[200]!,
            width: 1.3,
          ),
          bottom: BorderSide(
            color: Colors.grey[200]!,
            width: 1.3,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 17),
        child: AnimationLimiter(
          child: SlideAnimation(
            verticalOffset: 50,
            duration: Duration(milliseconds: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  constraints: const BoxConstraints(maxWidth: 150),
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 4, right: 5, left: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[400]!, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/growth.svg",
                        height: 10,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Actively Hiring",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    internship?.title ?? 'No Title',
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.w600),
                  ),
                  trailing: Container(
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/logo.png")),
                  subtitle: Text(
                   internship?.companyName ?? 'No Company',
                    style:
                        const TextStyle(fontSize: 15, color: Color(0xff8A8A8A)),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/location.svg",
                      height: 15,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 5),
                    Text(
                     internship?.locationNames.toString() == '[]'
                          ? "Location not mentioned"
                          : internship?.locationNames.join(', ') ?? "",
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/starting.svg",
                          height: 15.5,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          "${internship?.startDate}",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/calender.svg",
                          height: 19,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          "${internship?.duration}",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/stipend.svg",
                      height: 10,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      internship?.stipend['salary'] == null
                          ? "Stipend not mentioned"
                          : "${internship?.stipend['salary']}",
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border:
                        Border.all(color: const Color(0xffECECEC), width: 1),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text("${internship?.employmentType}"),
                ),
                const SizedBox(height: 19),
                Divider(
                  height: 0.4,
                  thickness: 0.6,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View details",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: const Text(
                        "Apply now",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
