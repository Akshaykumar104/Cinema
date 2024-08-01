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
        home: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M O O V I Z'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Favorite Movies',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            Consumer<FavoriteMoviesProvider>(
              builder: (context, favoriteMoviesProvider, child) {
                var favoriteMovies = favoriteMoviesProvider.favoriteMovies;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: favoriteMovies.length,
                  itemBuilder: (context, index) {
                    var movie = favoriteMovies[index];
                    return ListTile(
                      title: Text(movie.originalTitle),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: const Splashscreen(),
    );
  }
}
