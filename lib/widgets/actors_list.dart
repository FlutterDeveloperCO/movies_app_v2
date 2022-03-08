import 'package:app_movies_v2/providers/movies_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class ActorsList extends StatelessWidget {
  final int movieId;

  const ActorsList(this.movieId);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
        future: moviesProvider.getMovieActors(movieId),
        builder: (_, AsyncSnapshot<List<Cast>> snapshot) {

          if (!snapshot.hasData) {

            return Container(
              constraints: BoxConstraints(maxWidth: 150),
              height: 180,
              child: CupertinoActivityIndicator(),

            );

          }
          
          final List<Cast> actors = snapshot.data!;

          return Container(
            height: 180,
            margin: EdgeInsets.only(bottom: 30),
            width: double.infinity,
            child: ListView.builder(
              itemCount: actors.length,
              itemBuilder: (_, int index) => _ActorCard(actors[index]),
              scrollDirection: Axis.horizontal,
            ),
          );
        });
  }
}

class _ActorCard extends StatelessWidget {

  final Cast actor;

  const _ActorCard(this.actor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(actor.fullProfile),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
