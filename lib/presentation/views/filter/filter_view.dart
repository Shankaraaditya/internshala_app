import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:internshala_app/app/config/app_colors.dart';
import 'package:internshala_app/presentation/controllers/filter/filter_controller.dart';
import 'package:internshala_app/presentation/views/filter/widgets/filterWidget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FilterView extends StatefulWidget {
  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  @override
  Widget build(BuildContext context) {
    final FilterController filterController = Get.find<FilterController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 40,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: const Text(
          "Filters",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        return Stack(
        children: [
          Row(
            children: [
              Checkbox(
                activeColor: AppColors.primaryColor,
                value: filterController.isChecked.value,
                onChanged: (value) {
                  filterController.isChecked.value = value!;
                },
              ),
              AutoSizeText.rich(
                TextSpan(
                  text: "As per my",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text: " preferences",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: Adaptive.h(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FilterWidget(
                              ontap: () {
                                if (!filterController.isChecked.value) {
                                  Get.toNamed('/profilefilter');
                                } else {
                                  _showPopup(context);
                                }
                              },
                              title: "PROFILE",
                              subtitle: "Profile",
                              child: (filterController
                                      .selectedProfiles.isNotEmpty)
                                  ? SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: filterController
                                            .selectedProfiles
                                            .map((profile) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Chip(
                                                    label: Text(profile),
                                                    deleteIcon: const Icon(
                                                      Icons.close,
                                                      size: 18,
                                                      color: Colors.white,
                                                    ),
                                                    onDeleted: () {
                                                      filterController
                                                          .selectedProfiles
                                                          .remove(profile);
                                                      // filterController
                                                      //     .notifyListeners();
                                                    },
                                                    backgroundColor:
                                                        const Color(0xff007BFF),
                                                    labelStyle: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                      ),
                                    )
                                  : Container(),
                            ),
                            const SizedBox(height: 20),
                            FilterWidget(
                              ontap: () {
                                if (!filterController.isChecked.value) {
                                  // context.push('/locationfilter');
                                  Get.toNamed('/locationfilter');
                                } else {
                                  _showPopup(context);
                                }
                              },
                              title: "CITY",
                              subtitle: "City",
                              child: (filterController
                                      .selectedLocations.isNotEmpty)
                                  ? SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: filterController
                                            .selectedLocations
                                            .map((location) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Chip(
                                                    label: Text(location),
                                                    deleteIcon: const Icon(
                                                      Icons.close,
                                                      size: 18,
                                                      color: Colors.white,
                                                    ),
                                                    onDeleted: () {
                                                      filterController
                                                          .selectedLocations
                                                          .remove(location);
                                                      // filterController
                                                      //     .notifyListeners();
                                                    },
                                                    backgroundColor:
                                                        const Color(0xff007BFF),
                                                    labelStyle: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                      ),
                                    )
                                  : Container(),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "MAXIMUM DURATION (Min 1 Month)",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff6C757D),
                              ),
                            ),
                            const SizedBox(height: 13),
                            DropdownButtonHideUnderline(
                              child: DropdownButton2<int>(
                                isExpanded: true,
                                hint: Text(
                                  'Select duration',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                value: filterController.selectedDuration.value,
                                items: [1, 2, 3, 4, 6, 12, 24, 36]
                                    .map((int value) => DropdownMenuItem<int>(
                                          value: value,
                                          child: Text(
                                            value.toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (newValue) {
                                  if (!filterController.isChecked.value) {
                                    filterController.selectedDuration.value =
                                        newValue ?? 1;
                                  } else {
                                    _showPopup(context);
                                  }
                                },
                                selectedItemBuilder: (BuildContext context) {
                                  return [1, 2, 3, 4, 6, 12, 24, 36]
                                      .map<Widget>((int item) {
                                    return Container(
                                      alignment: Alignment.centerLeft,
                                      constraints:
                                          const BoxConstraints(minWidth: 100),
                                      child: Chip(
                                        deleteIcon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        onDeleted: () {
                                          filterController
                                              .selectedDuration.value = 1;
                                        },
                                        label: Text(
                                          '${item.toString()} months',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        backgroundColor:
                                            const Color(0xff007BFF),
                                        labelStyle: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    );
                                  }).toList();
                                },
                                iconStyleData: IconStyleData(
                                  icon: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.chevron_down,
                                        size: 17,
                                        color: AppColors.primaryColor,
                                      ),
                                      const SizedBox(
                                        width: 17,
                                      )
                                    ],
                                  ),
                                ),
                                buttonStyleData: ButtonStyleData(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primaryColor),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (filterController.isChecked.value)
                        Padding(
                          padding: EdgeInsets.only(top: Adaptive.h(0.5)),
                          child: GestureDetector(
                            onTap: () => _showPopup(context),
                            child: Container(
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 75,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: AnimationLimiter(

                child: AnimationConfiguration.synchronized(

                  child: SlideAnimation(
                    duration: Duration(seconds: 1),
                    verticalOffset: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // context.go('/internship');
                              filterController.clearAll();
                              Get.toNamed('/home');
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100, 45),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            child: Text(
                              "Clear all",
                              style: TextStyle(
                                fontSize: 17,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 13),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // context.go('/internship');
                              Get.toNamed('/home');
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100, 45),
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                            child: const Text(
                              "Apply",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
      }),
    );
  }


  // Toast message

  void _showPopup(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: const Color(0xff007BFF),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
      ),
      builder: (BuildContext context) {
        return const Padding(
          padding: EdgeInsets.only(top: 20.0, left: 25, right: 25, bottom: 20),
          child: Text(
            "Uncheck \"As per my preferences\" checkbox to search manually.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); 
    });
  }
}