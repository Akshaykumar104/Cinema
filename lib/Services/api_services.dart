import 'dart:convert';
import 'dart:developer';
import 'package:untitled/Models/Seach_movies.dart';
import '../Models/top_rated_movies.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.themoviedb.org/3/";
const apiKey = "?api_key=6f4678f0dd7755db9e193db9348151ad"; // Replace with your actual API key

class ApiServices {
  Future<TopRatedMovie> getTopRatedMovie() async {
    const endpoint = "movie/top_rated";
    const url = "$baseUrl$endpoint$apiKey";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        log("Success");
        return TopRatedMovie.fromJson(jsonDecode(response.body));
      } else {
        log("Failed to load top-rated movies: ${response.statusCode}");
        throw Exception("Failed to load top-rated movies");
      }
    } catch (e) {
      log("Error: $e");
      throw Exception("Error occurred: $e");
    }


  }
  Future<TopRatedMovie> getTrendingMovies() async {
    const endpoint = "movie/popular";
    const url = "$baseUrl$endpoint$apiKey";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        log("Success");
        return TopRatedMovie.fromJson(jsonDecode(response.body));
      } else {
        log("Failed to load top-rated movies: ${response.statusCode}");
        throw Exception("Failed to load top-rated movies");
      }
    } catch (e) {
      log("Error: $e");
      throw Exception("Error occurred: $e");
    }
  }
  Future<TopRatedMovie> getnowplaying() async {
    const endpoint = "movie/now_playing";
    const url = "$baseUrl$endpoint$apiKey";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        log("Success");
        return TopRatedMovie.fromJson(jsonDecode(response.body));
      } else {
        log("Failed to load top-rated movies: ${response.statusCode}");
        throw Exception("Failed to load top-rated movies");
      }
    } catch (e) {
      log("Error: $e");
      throw Exception("Error occurred: $e");
    }
  }
  Future<SearchMovieModel> getSearchedMovies(String searchText ) async {
    final endpoint = "search/movie?query=$searchText";
    final url = "$baseUrl$endpoint";
    try {
      final response = await http.get(
          Uri.parse(url),
        headers: {
            'Authorization' :
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZjQ2NzhmMGRkNzc1NWRiOWUxOTNkYjkzNDgxNTFhZCIsIm5iZiI6MTcyMjE2ODU0OC42NTEzODYsInN1YiI6IjY2YTYzMWQ5Mjc0NmVhZWI0YzA3Y2IxNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ie_FDinFF7ye2erkEMpGdY8kBZlg6X1II3cuX1k1L3Q"
        }
      );
      if (response.statusCode == 200) {
        log("Success");
        return SearchMovieModel.fromJson(jsonDecode(response.body));
      } else {
        log("Failed to load searched movies: ${response.statusCode}");
        throw Exception("Failed to load searched movies");
      }
    } catch (e) {
      log("Error: $e");
      throw Exception("Error occurred: $e");
    }
  }
}
