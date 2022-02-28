import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {

  //TODO: Cambiar argumentos por una instancia de movie.


  @override
  Widget build(BuildContext context) {
  
  final String movieSelected = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie-selected';
  
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo[900],
      expandedHeight: 200,

    );
  }
}