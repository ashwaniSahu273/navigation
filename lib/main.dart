import 'package:flutter/material.dart';
import 'package:movie_app/Providers/movie_provider.dart';
import 'package:movie_app/Widgets/movie_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (BuildContext context) => MovieProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   
  void initState(){
    Provider.of<MovieProvider>(context,listen:false).loadMovies(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title:const Text(
          "Movies",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: movieProvider.movieList.length,
          itemBuilder: (context, index) {
            return MovieCard(movie: movieProvider.movieList[index]);

            // ListTile(
            //   title: Text(movieProvider.movieList[index]),
            //   subtitle: Text("This is a subtitle"),
            //   trailing: Icon(Icons.sunny),
            //   isThreeLine: false,
            //   leading: CircleAvatar(
            //     child: Text(movieProvider.movieList[index].substring(0, 1)),
            //   ),

            // );
          },
        ),
      ),
    );
  }
}
