import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Models/top_rated_movies.dart';
import '../Common/Utils.dart';
import '../Common/dataSaved.dart';
import '../Screens/watch_list.dart';

class MovieCard extends StatelessWidget {
  final Future<TopRatedMovie> future;
  final String headLineText;

  const MovieCard({super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          headLineText,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.heart_fill, color: Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteMoviesScreen(),
                ),
              );
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<TopRatedMovie>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            var data = snapshot.data!.results;

            return LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = (constraints.maxWidth ~/ 200).clamp(2, 6);
                double childAspectRatio = (constraints.maxWidth / crossAxisCount) /
                    ((constraints.maxWidth / crossAxisCount) * (3 / 2));

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        itemCount: data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: childAspectRatio,
                        ),
                        itemBuilder: (context, index) {
                          var movie = data[index];
                          var isFavorite = context.watch<FavoriteMoviesProvider>().isFavorite(movie);
                          return GridTile(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AspectRatio(
                                  aspectRatio: 4 / 5,
                                  child: Stack(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: "$imageUrl${movie.posterPath}",
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                        const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: IconButton(
                                          icon: Icon(
                                            isFavorite
                                                ? CupertinoIcons.heart_solid
                                                : CupertinoIcons.heart,
                                            color: isFavorite ? Colors.red : Colors.white,
                                          ),
                                          onPressed: () {
                                            context.read<FavoriteMoviesProvider>().toggleFavoriteStatus(movie);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  movie.originalTitle,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
