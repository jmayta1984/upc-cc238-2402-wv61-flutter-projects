import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/domain/movie.dart';
import 'package:movie_app/features/movies/presentation/bloc/favorite_cubit.dart';
import 'package:movie_app/features/movies/presentation/widgets/cast_section.dart';
import 'package:movie_app/features/movies/presentation/widgets/review_section.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: height * 0.50,
            floating: true,
            pinned: true,
            actions: [
              BlocBuilder<FavoriteCubit, Movie>(
                builder: (context, state) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.black54, shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {
                        context.read<FavoriteCubit>().toggleFavorite();
                      },
                      icon: Icon(
                        state.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.yellow.shade800,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                movie.posterPath,
                height: height * 0.50,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${DateTime.parse(movie.releaseDate).year}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const Text(
                  'Story',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  movie.overview,
                   style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
                CastSection(movieId: movie.id),
                ReviewsSection(movieId: movie.id),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
