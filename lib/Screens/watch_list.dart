import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Common/Utils.dart';
import '../Common/dataSaved.dart';

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
      ),
      body: ListView.builder(
        itemCount: favoriteMovies.length,
        itemBuilder: (context, index) {
          var movie = favoriteMovies[index];
          return ListTile(
            leading: Image.network("$imageUrl${movie.posterPath}"),
            title: Text(
                movie.originalTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
