// presentation/views/tabs/home_tab.dart
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:internshala_app/data/models/internship_model.dart';
import 'package:internshala_app/presentation/controllers/filter/filter_controller.dart';
import 'package:internshala_app/presentation/controllers/home/home_controller.dart';
import 'package:internshala_app/presentation/views/widgets/internshipCard.dart';
import 'package:internshala_app/presentation/views/widgets/top_bar.dart';

// ignore: must_be_immutable
class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController internshipViewModel = Get.find<HomeController>();
    final FilterController filterController = Get.put(FilterController());

    // Using Obx to make sure the UI reacts to changes in observable properties
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: appBarActionWidgets,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
          onPressed: () {},
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Internships",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        // Ensure that internshipResponse is not null and has data
        List<Internship> internships = [];

        if (internshipViewModel.internshipResponse != null &&
            internshipViewModel
                .internshipResponse!.internshipsMeta.isNotEmpty) {
          internships = internshipViewModel
              .internshipResponse!.internshipsMeta.values
              .toList();
        }

        List<Internship> filteredInternships =
            filterController.filterInternships(internships);

        print("FILTERED INTERNSHIP LENGTH IS ${filteredInternships.length}");

        if (filteredInternships.isEmpty) {
          print(
              "Filtered is enpty assigning filteredInternships = internships");
          filteredInternships = internships;
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(totalInternships:filteredInternships.length,),
              Divider(
                height: 1,
                thickness: 1.3,
                color: Colors.grey[300],
              ),
              Expanded(
                child: filteredInternships.isEmpty
                    ? const Center(
                        child: Text('No internships found'),
                      )
                    : AnimationLimiter(
                      child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => Column(
                            children: [
                              Divider(
                                height: 1,
                                thickness: 1.3,
                                color: Colors.grey[100],
                              ),
                              Divider(
                                height: 10,
                                thickness: 10,
                                color: Colors.grey[100],
                              ),
                              Divider(
                                height: 1,
                                thickness: 1.3,
                                color: Colors.grey[100],
                              ),
                            ],
                          ),
                          itemCount: filteredInternships.length,
                          itemBuilder: (context, index) {
                            final internship = filteredInternships[index];
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              child: SlideAnimation(
                                verticalOffset: 50,
                                child: InternshipCard(internship: internship)));
                          },
                        ),
                    ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // ====================================================================
  List<Widget> appBarActionWidgets = [
    Row(
      children: [
        SvgPicture.asset(
          "assets/search.svg",
          height: 24,
        ),
        const SizedBox(width: 12),
        SvgPicture.asset(
          "assets/bookmark.svg",
          height: 22,
        ),
        const SizedBox(width: 12),
        const Icon(
          Icons.notifications_outlined,
          size: 23,
          color: Color(0xff333333),
        ),
        const SizedBox(width: 12),
        SvgPicture.asset(
          "assets/chat.svg",
          height: 16,
        ),
        const SizedBox(width: 18),
      ],
    )
  ];
}
