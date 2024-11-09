import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/domain/movie.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
            Image.network(
              movie.backdropPath,
              height: height * 0.60,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                  )),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${DateTime.parse(movie.releaseDate).year}',
                    style:  const TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            )
          ])),
    );
  }
}
