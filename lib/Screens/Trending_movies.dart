import 'package:flutter/material.dart';
import 'package:untitled/Screens/Search_Screen.dart';
import 'package:untitled/Services/api_services.dart';
import '../Models/top_rated_movies.dart';
import '../Widgets/movie_card.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({super.key});

  @override
  State<TrendingMovies> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<TrendingMovies> {
  late Future<TopRatedMovie> TrendingMovie;
  final ApiServices apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    TrendingMovie = apiServices.getTrendingMovies();
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
              future: TrendingMovie, headLineText :"Trending Movies",
            ),
          ),
        ],
      ),
    );
  }
}
