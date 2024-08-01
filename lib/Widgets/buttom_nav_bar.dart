import 'package:flutter/material.dart';
import 'package:untitled/Screens/Top_rated_movies.dart';
import 'package:untitled/Screens/Trending_movies.dart';
import '../Screens/On_theaters.dart';
// ignore: camel_case_types
class buttomNavBar extends StatelessWidget {
  const buttomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: Container(
            height: 70,
            color: Colors.black,
            child: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.movie_filter),
                  text: "Top Rated",
                ),
                Tab(
                  icon: Icon(Icons.trending_up),
                  text: "Trending Movie",
                ),
                Tab(
                  icon: Icon(Icons.theaters),
                  text: "on theaters",
                ),
              ],
              indicatorColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              dividerColor: Colors.transparent,
            ),
          ),
         body: const TabBarView(children: [
           TopMovies(),
           TrendingMovies(),
           OnTheaters()
         ]),
        ),
    );
  }
}
