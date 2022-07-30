import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_outlined),
          )
        ],
        title: Text('Películas en cines'),
      ),

      // SingleChildScrollView para poder hacer scroll a los demas moviesilder que deseo crear, pero por el momento no
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tarjetas principales
            CardSwiper(movies: moviesProvider.onDisplayMovies),

            // Slider de películas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Popularesss',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
