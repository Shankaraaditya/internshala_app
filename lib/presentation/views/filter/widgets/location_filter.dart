import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:internshala_app/app/config/app_colors.dart';
import 'package:internshala_app/presentation/controllers/filter/filter_controller.dart';
import 'package:internshala_app/presentation/controllers/home/home_controller.dart';

class LocationFilterView extends StatefulWidget {
  const LocationFilterView({super.key});

  @override
  _LocationFilterViewState createState() => _LocationFilterViewState();
}

class _LocationFilterViewState extends State<LocationFilterView> {
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
        leadingWidth: 40,
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
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              filterController
                  .updateSelectedLocations(_selectedInternships);
              navigator?.pop();
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
                fontSize: 16,
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
          "City",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        final locations = internshipViewModel.internshipResponse!.internshipsMeta.values
            .where((internship) => internship.locationNames != null)
            .expand((internship) => internship.locationNames)
            .toSet()
            .toList();

        final filteredLocations = locations.where((location) {
          return location.toLowerCase().contains(_searchQuery.toLowerCase());
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
                          labelText: "Search city",
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
                            children: _selectedInternships.map((location) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Chip(
                                  label: Text(location,
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
                                      _selectedInternships.remove(location);
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
                        itemCount: filteredLocations.length,
                        itemBuilder: (context, index) {
                          final location = filteredLocations[index];
                          final isSelected = _selectedInternships.contains(location);
              
                          return ListTile(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  _selectedInternships.remove(location);
                                } else {
                                  _selectedInternships.add(location);
                                }
                              });
                            },
                            leading: Checkbox(
                              activeColor: const Color(0xff008de0),
                              value: isSelected,
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    _selectedInternships.add(location);
                                  } else {
                                    _selectedInternships.remove(location);
                                  }
                                });
                              },
                            ),
                            title: Text(location),
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
