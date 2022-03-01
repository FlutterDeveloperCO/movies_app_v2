import 'package:flutter/material.dart';
import 'package:app_movies_v2/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  //TODO: Cambiar argumentos por una instancia de movie.

  @override
  Widget build(BuildContext context) {
    final String movieSelected =
        ModalRoute.of(context)?.settings.arguments.toString() ??
            'no-movie-selected';

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          _TitleAndPoster(),
          _Overview(),
          _Overview(),
          ActorsList(),
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
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
          padding: EdgeInsets.only(bottom: 8),
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black26,
            child: Text(
              'movie.title',
              style: TextStyle(fontSize: 20),
            )),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _TitleAndPoster extends StatelessWidget { 
  
  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title',
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'movie.originalTitle',
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
                    'movie.voteAverage',
                    style: textTheme.caption,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme; 

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Text(
          'Describir es explicar, de manera detallada y ordenada, cómo son las personas, animales, lugares, objetos, etc. La descripción sirve sobre todo para ambientar la acción y crear una que haga más creíbles los hechos que se narran. Muchas veces, contribuyen a detener la acción y preparar el escenario de los hechos que siguen. La descripción también se puede definir como la representación verbal de los rasgos propios de un objeto. Al describir una persona, un animal, un sentimiento, etc. Se expresan aquellas características que hacen peculiar a lo descrito, y lo diferencia de otros objetos de otra o de la misma clase.',
          textAlign: TextAlign.justify,
          style: textTheme.subtitle1,),
    );
  }
}
