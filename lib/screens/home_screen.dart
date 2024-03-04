import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/controllers/global_controller.dart';
import 'package:travel_app/widget/Google_places_autocomplete_widget.dart';
import 'package:travel_app/widget/app_large_text.dart';
import 'package:travel_app/widget/app_text.dart';
import 'package:travel_app/widget/place_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController tabController;
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    tabController.addListener(() {
      final int currentIndex = tabController.index;
      final String newType =
          getTypeForIndex(currentIndex); // Implement this method
      globalController.setPlaceType(newType);
    });

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    delay: const Duration(milliseconds: 300),
                    child: const AppLargeText(
                      text: "Explore the",
                      size: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    child: const AppText(
                      text: "beautiful places",
                      size: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 500),
                    child: Padding(
                        padding: EdgeInsets.only(
                            bottom: size.height * 0.01,
                            top: size.height * 0.02),
                        child: Obx(() => GooglePlacesAutocompleteWidget(
                            placeName: globalController.placeName.value,
                            setPlaceName: globalController.setPlaceName))),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 600),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      width: size.width,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          labelPadding: EdgeInsets.only(
                              left: size.width * 0.03,
                              right: size.width * 0.03),
                          controller: tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: const [
                            Tab(
                              text: "Hotels",
                            ),
                            Tab(text: "Restarants"),
                            Tab(text: "Attractions"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(() {
                    if (globalController.isLoading.isTrue) {
                      return const Align(
                        heightFactor: 10.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (globalController.places.isEmpty) {
                        return const Align(
                          heightFactor: 10.0,
                          child: AppLargeText(
                            text: 'No data found.',
                            color: Colors.black,
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 480.0,
                          child: ListView.builder(
                            itemCount: globalController.places.length,
                            itemBuilder: (context, index) {
                              final place = globalController.places[index];
                              return Container(
                                  padding: const EdgeInsets.all(12.0),
                                  child: PlaceCard(place: place));
                            },
                          ),
                        );
                      }
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String getTypeForIndex(int index) {
    switch (index) {
      case 0:
        return 'hotels';
      case 1:
        return 'restaurants';
      case 2:
        return 'attractions';
      default:
        return 'hotels';
    }
  }
}
