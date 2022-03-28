import 'package:flutter/material.dart';
import 'package:fluttermovieapp/utils/text.dart';
import 'package:fluttermovieapp/widgets/toprated.dart';
import 'package:fluttermovieapp/widgets/trending.dart';
import 'package:fluttermovieapp/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '040d98c28d440803a276356543250164';
  final String readacesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNDBkOThjMjhkNDQwODAzYTI3NjM1NjU0MzI1MDE2NCIsInN1YiI6IjYyNDAwYjFiOTQ1MWU3MDA4YzhkOGUwMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KWMbGthSgEf_d4ZP0avj9yPs19feN2rg1eSxGrKbjAA';
  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCoustomLogs = TMDB(
      ApiKeys(apikey, readacesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map tredingresults = await tmdbWithCoustomLogs.v3.trending.getTrending();
    Map topratedresults = await tmdbWithCoustomLogs.v3.movies.getTopRated();
    Map tvresults = await tmdbWithCoustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = tredingresults['results'];
      topratedmovies = topratedresults['results'];
      tv = tvresults['results'];
    });
  }

  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: modified_text(text: 'Movie App', color: Colors.blue, size: 20),
      ),
      body: ListView(
        children: [
          TV(tvshows: tv),
          TopRated(toprated: topratedmovies),
          TrendingMovies(trending: trendingmovies),
        ],
      ),
    );
  }
}
