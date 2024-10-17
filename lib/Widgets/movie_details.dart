


import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/movie_card.dart';
import 'package:movie_app/models/movie.model.dart';


class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});

 final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Movie Details"),
      ),
      body: Column(
        children: [
          MovieCard(movie: movie),
          Text("Movie Posters",style: Theme.of(context).textTheme.displaySmall,),
           SizedBox(
            height: 200,
            width:double.infinity,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movie.images!.length,
              itemBuilder: (context,index){
                return Card(
                  elevation: 6.0,
                  child: Image.network(movie.images![index]));
              },
              
            )

          )
        ]
      )
    );
  }
}
