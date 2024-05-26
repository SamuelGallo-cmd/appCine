import 'package:appcine/model/peliculas.dart';
import 'package:flutter/material.dart';

class InfoPelicula extends StatelessWidget {
  const InfoPelicula({Key? key, required this.pelicula}) : super(key: key);
  
  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(
              height: 75,
              width: 75,
              margin: const EdgeInsets.only(
                top: 8,
                left: 8,
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 209, 213, 221),
                borderRadius: BorderRadius.circular(7),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            backgroundColor: Colors.blue,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            title: Text(
              pelicula.title,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 251, 251),
                decoration: TextDecoration.underline,
                decorationThickness: 3,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://image.tmdb.org/t/p/w500/${pelicula.poster_path}',
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Resumen',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    pelicula.overview,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 42, 41, 41),
                      fontSize: 16,
                       fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 8),
                  Text("Lanzamiento: "+
                    pelicula.release_date,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 42, 41, 41),
                      fontSize: 16,
                       fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
