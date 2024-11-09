import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/domain/movie.dart';
import 'package:movie_app/features/movies/presentation/blocs/favorite_cubit.dart';

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
              BlocBuilder<FavoriteCubit, bool>(
                builder: (context, state) => IconButton(
                  onPressed: () {
                    context.read<FavoriteCubit>().toggleFavorite();
                  },
                  icon: Icon(
                    state ? Icons.bookmark : Icons.bookmark_border,
                    color: Colors.yellow.shade700,
                    size: 40,
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
                Text(
                  movie.overview,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
