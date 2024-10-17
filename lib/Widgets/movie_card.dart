
import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/movie_details.dart';
import 'package:movie_app/models/movie.model.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ExpansionTile(
        
        title: Text("${movie.title}"),
        subtitle: Text("Director : ${movie.director}"),
        leading: CircleAvatar(
           backgroundImage: NetworkImage(movie.images![0]),
        ),
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 75),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Released : ",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                   TextSpan(
                      text: "${movie.year}\n",
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "Plot: ",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:movie.plot
                          ,
                      style: TextStyle(color: Colors.black))
                ]
                )
                ),
                TextButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>MovieDetails(movie:movie,)));
                }, child: Text("Read More", style: TextStyle(color: Colors.blue),))
              ],
            ),
          )
        ],
      ),
    );
  }
}
