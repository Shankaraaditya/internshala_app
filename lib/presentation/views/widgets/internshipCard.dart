import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internshala_app/app/config/app_colors.dart';
import 'package:internshala_app/data/models/internship_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable

class InternshipCard extends StatefulWidget {
  final Internship internship;

  InternshipCard({Key? key, required this.internship}) : super(key: key);

  @override
  _InternshipCardState createState() => _InternshipCardState();
}

class _InternshipCardState extends State<InternshipCard> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds:1));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? _buildShimmer() : _buildContent();
  }

  Widget _buildShimmer() {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder for the actively hiring badge
          Container(
            width: 150,
            height: 20,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Placeholder for the internship title
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 20,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Placeholder for the company name
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 15,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Placeholder for the location
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 15,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Placeholder for the start date
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 15,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Placeholder for the duration
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 15,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Placeholder for the stipend
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 15,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Placeholder for the employment type
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 20,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    ),
  );
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
            horizontalOffset: 50,
            duration: Duration(milliseconds: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  constraints: const BoxConstraints(maxWidth: 150),
                  padding:
                      const EdgeInsets.only(top: 4, bottom: 4, right: 5, left: 4),
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
                    widget.internship?.title ?? 'No Title',
                    style:
                        const TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                  ),
                  trailing: Container(
                      height: 30, width: 30, child: Image.asset("assets/logo.png")),
                  subtitle: Text(
                    widget.internship?.companyName ?? 'No Company',
                    style: const TextStyle(fontSize: 15, color: Color(0xff8A8A8A)),
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
                      widget.internship?.locationNames.toString() == '[]'
                          ? "Location not mentioned"
                          : widget.internship?.locationNames.join(', ') ?? "",
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
                          "${widget.internship?.startDate}",
                          style: const TextStyle(fontSize: 14, color: Colors.black),
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
                          "${widget.internship?.duration}",
                          style: const TextStyle(fontSize: 14, color: Colors.black),
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
                      widget.internship?.stipend['salary'] == null
                          ? "Stipend not mentioned"
                          : "${widget.internship?.stipend['salary']}",
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: const Color(0xffECECEC), width: 1),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text("${widget.internship?.employmentType}"),
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

