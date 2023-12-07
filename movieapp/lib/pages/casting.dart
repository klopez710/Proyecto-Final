import 'package:flutter/material.dart';
import 'package:movieapp/constants.dart';
import 'package:movieapp/models/cast.dart';

class Casting extends StatelessWidget {
  const Casting({
    super.key,
    required this.credits,
  });

  final List<Cast> credits;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: credits.map((index) {
          return Card(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                      width: 100,
                      height: 150,
                      child: (index.profilePath != null)
                          ? Image.network(
                        "${Constants.imagePath}${index.profilePath}",
                        fit: BoxFit.cover,
                      )
                          : const Center(
                        child: Icon(
                          Icons.person_2,
                          size: 120,
                        ),
                      )),
                ),
                Text(index.name),
                Text(index.character)
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}