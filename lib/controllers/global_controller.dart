import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:travel_app/api/travel_api.dart';

class GlobalController extends GetxController {
  final RxString placeName = 'Kharkiv'.obs;
  final RxList<dynamic> places = <dynamic>[].obs;
  final RxString type = 'hotels'.obs;
  final RxBool _isLoading = true.obs;

  RxBool get isLoading => _isLoading;

  @override
  void onInit() {
    ever(placeName, (_) {
      _isLoading.value = true;
      getPlaces();
    });

    if (_isLoading.isTrue) {
      getPlaces();
    }

    super.onInit();
  }

  Future<void> getPlaces() async {
    try {
      final List<Location> locations =
          await locationFromAddress(placeName.value);

      if (locations.isNotEmpty) {
        final Location first = locations.single;

        places.value = await TripAdvisorApi.fetchPropertiesByLatLng(
          latitude: first.latitude.toString(),
          longitude: first.longitude.toString(),
          propertyType: type.value,
        );
      } else {
        print('No coordinates found for ${placeName.value}');
      }
    } catch (e) {
      print('Error fetching coordinates: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  void setPlaceName(String place) {
    placeName.value = place;
  }

  void setPlaceType(String newType) {
    type.value = newType;
    _isLoading.value = true;
    getPlaces();
  }
}
