import 'package:flutter/material.dart';
import 'package:untitled/Screens/Search_Screen.dart';
import 'package:untitled/Services/api_services.dart';
import '../Models/top_rated_movies.dart';
import '../Widgets/movie_card.dart';

class TopMovies extends StatefulWidget {
  const TopMovies({super.key});

  @override
  State<TopMovies> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<TopMovies> {
  late Future<TopRatedMovie> topRatedMoviesFuture;
  final ApiServices apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    topRatedMoviesFuture = apiServices.getTopRatedMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.black,
        title: const Text(
          "M O O V I Z",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
            child: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 30),
          const Icon(
            Icons.person_rounded,
            color: Colors.white,
            size: 30,
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 716,
            child: MovieCard(
              future: topRatedMoviesFuture, headLineText :"TOP RATED MOVIES",
            ),
          ),
        ],
      ),
    );
  }
}
