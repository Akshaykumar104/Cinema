import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Models/top_rated_movies.dart';

import '../Common/Utils.dart';
import '../Common/dataSaved.dart';
import '../Widgets/buttom_nav_bar.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  const FavoriteMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var favoriteMovies = context.watch<FavoriteMoviesProvider>().favoriteMovies;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Favorite Movies",
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => buttomNavBar(),));
          },
          child: Icon(
              Icons.arrow_back,
            color: Colors.white,

          ),
        ),

      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: favoriteMovies.length,
        itemBuilder: (context, index) {
          var movie = favoriteMovies[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Container(
                  width: 150, // Increased width
                  height: 225, // Increased height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage("$imageUrl${movie.posterPath}"),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16.0), // Space between image and text
                Expanded(
                  child: Text(
                    movie.originalTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
