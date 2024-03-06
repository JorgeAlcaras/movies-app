import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/search/search_delegate.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies in theaters',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => showSearch(
                    context: context,
                    delegate: MovieSearchDelegate(),
                  )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Principal Cards
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            //Slider Movies
            MovieSlider(
              movies: moviesProvider.popularMovies,
              movieTitle: 'Popular',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
            MovieSlider(
                movies: moviesProvider.topMovies,
                movieTitle: 'Top Rated',
                onNextPage: () => moviesProvider.getTopRateMovies()),
          ],
        ),
      ),
    );
  }
}
