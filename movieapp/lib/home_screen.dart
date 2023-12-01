import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/api/api.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/widgets/Populares.dart';
import 'package:movieapp/widgets/Proximas_movies.dart';
import 'package:movieapp/widgets/Tendencias.dart';
import 'package:movieapp/widgets/logo_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
late Future<List<Movie>> tendencias;

@override
void initState() {
  super.initState();
  tendencias = Api().getTendencias();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Logo(),
        /*Image.asset(
          'assets/logo.png',
          fit: BoxFit.cover,
          height: 100,
          filterQuality: FilterQuality.high,
        ),*/
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tendencias',
                style: GoogleFonts.ubuntu(fontSize: 20),
              ),
              const SizedBox(
                height: 32,
              ),
              const Tendencias(),
              const SizedBox(height: 32),
              Text(
                'Peliculas Populares',
                style: GoogleFonts.ubuntu(fontSize: 20),
              ),
              const SizedBox(height: 32),
              const Populares(),
              const SizedBox(height: 32),
              Text(
                'Proximas Peliculas',
                style: GoogleFonts.ubuntu(fontSize: 20),
              ),
              const SizedBox(height: 32),
              const Proximas(),
            ],
          ),
        ),
      ),
    );
  }
}
