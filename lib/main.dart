import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Models/top_rated_movies.dart';
import 'Common/dataSaved.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/watch_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoriteMoviesProvider(),
      child: MaterialApp(
        title: 'M O O V I Z',
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 24, color: Colors.white),
            bodyMedium: TextStyle(fontSize: 20, color: Colors.white),
            bodySmall: TextStyle(fontSize: 16, color: Colors.white),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: Colors.black),
          useMaterial3: true,
        ),
        home: const Splashscreen(),
      ),
    );
  }
}

