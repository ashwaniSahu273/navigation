import 'package:flutter/material.dart';
import 'package:movie_app/Providers/movie_model.dart';
import 'package:movie_app/Widgets/movie_details.dart';
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
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movies",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: movieProvider.movieList.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10),
              child: ExpansionTile(
                title: Text(movieProvider.movieList[index]),
                subtitle: Text("Director : mohan kumar"),
                leading: CircleAvatar(
                  child: Text(movieProvider.movieList[index].substring(0, 1)),
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
                          const TextSpan(
                              text: "24th oct 2004\n",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "Plot: ",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          const TextSpan(
                              text:
                                  "This is a text this is a text text text textThis is a text this is a text text text textThis is a text this is a text text text textThis is a text this is a text text text text",
                              style: TextStyle(color: Colors.black))
                        ]
                        )
                        ),
                        TextButton(onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>MovieDetails()));
                        }, child: Text("Read More", style: TextStyle(color: Colors.blue),))
                      ],
                    ),
                  )
                ],
              ),
            );

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
