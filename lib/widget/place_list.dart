import 'package:flutter/material.dart';

class PlaceListWidget extends StatelessWidget {
  final List<dynamic> places;

  const PlaceListWidget({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          "Places",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Flexible(
          child: ListView.builder(
            itemCount: places.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(places[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
