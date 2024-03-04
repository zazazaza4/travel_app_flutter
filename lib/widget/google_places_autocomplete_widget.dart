import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:travel_app/api/config.dart';
import 'package:travel_app/widget/app_text.dart';

class GooglePlacesAutocompleteWidget extends StatefulWidget {
  final String placeName;
  final Function(String) setPlaceName;

  const GooglePlacesAutocompleteWidget(
      {super.key, required this.placeName, required this.setPlaceName});

  @override
  _GooglePlacesAutocompleteWidgetState createState() =>
      _GooglePlacesAutocompleteWidgetState();
}

class _GooglePlacesAutocompleteWidgetState
    extends State<GooglePlacesAutocompleteWidget> {
  final TextEditingController _controller = TextEditingController();
  List<Prediction> _suggestions = [];
  late GoogleMapsPlaces _places;

  @override
  void initState() {
    super.initState();
    _places = GoogleMapsPlaces(apiKey: GOOGLE_API_KEY);
  }

  @override
  void dispose() {
    _places.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: _controller,
        onChanged: _onSearchChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20,
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 240, 240, 240),
          prefixIcon: IconButton(
            onPressed: _onSearch,
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          hintText: widget.placeName,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      SingleChildScrollView(
        child: _suggestions.isNotEmpty
            ? ListView.builder(
                itemCount: _suggestions.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: AppText(
                      text: _suggestions[index].description!,
                      color: Colors.black,
                    ),
                    onTap: () {
                      // Handle the selected place
                      widget
                          .setPlaceName(_suggestions[index].description ?? '');
                      _controller.clear();
                      _suggestions.clear();
                    },
                  );
                },
              )
            : Container(),
      ),
    ]);
  }

  void _onSearchChanged(String value) async {
    final response = await _places.autocomplete(
      value,
      language: 'en',
    );

    setState(() {
      _suggestions = response.predictions;
    });
  }

  void _onSearch() {
    _onSearchChanged(_controller.text);
  }
}
