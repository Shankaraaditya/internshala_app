import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:internshala_app/app/config/app_colors.dart';
import 'package:internshala_app/presentation/controllers/filter/filter_controller.dart';
import 'package:internshala_app/presentation/controllers/home/home_controller.dart';

class ProfileFilterView extends StatefulWidget {
  const ProfileFilterView({super.key});

  @override
  _ProfileFilterViewState createState() => _ProfileFilterViewState();
}

class _ProfileFilterViewState extends State<ProfileFilterView> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<String> _selectedInternships = [];

  @override
  Widget build(BuildContext context) {
    final HomeController internshipViewModel = Get.find<HomeController>();
    final FilterController filterController = Get.find<FilterController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 30,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            navigator?.pop();
          },
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {
              _searchController.clear();
              setState(() {
                _searchQuery = '';
                _selectedInternships.clear();
              });
            },
            child: Text(
              "Clear all",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              log('Selected Internships: $_selectedInternships');
              filterController
                  .updateSelectedProfiles(_selectedInternships);
              Get.toNamed('/filters');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Text(
              "Apply",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        final internships = internshipViewModel.internshipResponse!.internshipsMeta.values
            .where((internship) => internship.title != null)
            .map((internship) => internship.title!)
            .toSet();
        final filteredInternships = internships.where((title) {
          return title.toLowerCase().contains(_searchQuery.toLowerCase());
        }).toList();

        return AnimationLimiter(
          child: AnimationConfiguration.synchronized(

            child: FlipAnimation(
              duration: Duration(seconds: 1),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          labelText: "Search profile",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 22.0, vertical: 15),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                      ),
                    ),
                    if (_selectedInternships.isNotEmpty)
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: _selectedInternships.map((title) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Chip(
                                  label: Text(title,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                  deleteIcon: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  backgroundColor: const Color(0xff008de0),
                                  onDeleted: () {
                                    setState(() {
                                      _selectedInternships.remove(title);
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredInternships.length,
                        itemBuilder: (context, index) {
                          final internship = filteredInternships[index];
                          final title = filteredInternships[index];
                          var isSelected = _selectedInternships.contains(title);
                          bool isselected = false;
              
                          return ListTile(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  _selectedInternships.remove(title);
                                } else {
                                  _selectedInternships.add(title);
                                }
                              });
                            },
                            leading: Checkbox(
                              activeColor: const Color(0xff008de0),
                              value: isSelected,
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    _selectedInternships.add(title);
                                  } else {
                                    _selectedInternships.remove(title);
                                  }
                                });
                              },
                            ),
                            title: Text(
                              title ?? 'No Title',
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
            ),
          ),
        );
      }),
    );
  }
}
