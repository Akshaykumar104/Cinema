import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Models/top_rated_movies.dart';

class FavoriteMoviesProvider with ChangeNotifier {
  List<Result> _favoriteMovies = [];
  late SharedPreferences prefs;

  FavoriteMoviesProvider() {
    _loadFavorites();
  }

  List<Result> get favoriteMovies => _favoriteMovies;

  void _loadFavorites() async {
    prefs = await SharedPreferences.getInstance();
    final favoriteList = prefs.getStringList('favorites') ?? [];
    _favoriteMovies = favoriteList.map((e) => Result.fromJson(json.decode(e))).toList();
    notifyListeners();
  }

  void _saveFavorites() {
    List<String> favorites = _favoriteMovies.map((e) => json.encode(e.toJson())).toList();
    prefs.setStringList('favorites', favorites);
  }

  void toggleFavoriteStatus(Result movie) {
    if (_favoriteMovies.any((m) => m.id == movie.id)) {
      _favoriteMovies.removeWhere((m) => m.id == movie.id);
    } else {
      _favoriteMovies.add(movie);
    }
    _saveFavorites();
    notifyListeners();
  }

  bool isFavorite(Result movie) {
    return _favoriteMovies.any((m) => m.id == movie.id);
  }
}
