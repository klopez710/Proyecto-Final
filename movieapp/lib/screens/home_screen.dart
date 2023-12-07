import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/api/api.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/pages/populares.dart';
import 'package:movieapp/pages/proximas_movies.dart';
import 'package:movieapp/pages/tendencias.dart';
import 'package:movieapp/widgets/logo_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> tendencias;
  late Future<List<Movie>> populares;
  late Future<List<Movie>> proximas;

  @override
  void initState() {
    super.initState();
    tendencias = Api().getTendencias();
    populares = Api().getPopulares();
    proximas = Api().getProximas();
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
                height: 28,
              ),
              SizedBox(
                child: FutureBuilder(
                  future: tendencias,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return Tendencias(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'Peliculas Populares',
                style: GoogleFonts.ubuntu(fontSize: 20),
              ),
              const SizedBox(height: 28),
              SizedBox(
                child: FutureBuilder(
                  future: populares,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return Populares(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Proximas Peliculas',
                style: GoogleFonts.ubuntu(fontSize: 20),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: proximas,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return Proximas(
                        snapshot: snapshot,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
