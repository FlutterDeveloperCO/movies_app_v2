import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_movies_v2/providers/movies_provider.dart';
import 'package:app_movies_v2/widgets/widgets.dart';
import '../search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies in Theaters'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            MovieSlider(
                title: 'Most Populars',
                movies: moviesProvider.popularMoviesNow,
                onNextPage: () => moviesProvider.getPopularMovies(),
                ),
          ],
        ),
      ),
    );
  }
}
