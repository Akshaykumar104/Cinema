import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Models/Seach_movies.dart';
import 'package:untitled/Services/api_services.dart';
import '../Common/Utils.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  ApiServices apiServices = ApiServices();
  SearchMovieModel? searchMovieModel;

  void search(String query) {
    apiServices.getSearchedMovies(query).then((results) {
      setState(() {
        searchMovieModel = results;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: CupertinoSearchTextField(
                  controller: searchController,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: const Icon(
                    Icons.cancel,
                    color: Colors.grey,
                  ),
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      search(searchController.text);
                    }
                  },
                ),
              ),
              if (searchMovieModel != null)
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: searchMovieModel?.results.length ?? 0,
                  itemBuilder: (context, index) {
                    var movie = searchMovieModel!.results[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 7.0),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: "$imageUrl${movie.backdropPath}",
                            height: 150,
                            width: 100,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.originalTitle,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  movie.overview,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
