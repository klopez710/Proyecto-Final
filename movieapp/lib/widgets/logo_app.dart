
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Pelis',
          style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 15,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Container(
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'hub',
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}