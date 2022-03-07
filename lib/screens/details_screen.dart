import 'package:flutter/material.dart';
import 'package:app_movies_v2/widgets/widgets.dart';
import '../models/models.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Movie movie =
        ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(movie),
        SliverList(
            delegate: SliverChildListDelegate([
          _TitleAndPoster(movie),
          _Overview(movie),
          ActorsList(),
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo[900],
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black26,
            child: Text(
              movie.title,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.backDropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _TitleAndPoster extends StatelessWidget {

  final Movie movie;

  const _TitleAndPoster(this.movie);
  
  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.fullPoster),
              height: 150,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          ConstrainedBox(constraints: BoxConstraints(maxWidth: size.width - 170),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  movie.originalTitle,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.yellow[900],
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '${movie.voteAverage}',
                      style: textTheme.caption,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  final Movie movie;

  const _Overview(this.movie);

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme; 

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Text(
          movie.overview,
          textAlign: TextAlign.justify,
          style: textTheme.subtitle1,),
    );
  }
}
