import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/presentation/bloc/review_bloc.dart';
import 'package:movie_app/features/movies/presentation/bloc/review_event.dart';
import 'package:movie_app/features/movies/presentation/widgets/review_list.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key, required this.movieId});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Reviews',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        SizedBox(
          height: 150,
          child: BlocProvider(
            create: (context) =>
                ReviewBloc()..add(ReviewsLoad(movieId: movieId)),
            child: const ReviewsList(),
          ),
        ),
      ],
    );
  }
}
