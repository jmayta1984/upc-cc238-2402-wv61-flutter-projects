import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/domain/review.dart';
import 'package:movie_app/features/movies/presentation/bloc/review_bloc.dart';
import 'package:movie_app/features/movies/presentation/bloc/review_state.dart';
import 'package:movie_app/features/movies/presentation/widgets/review_list_item.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewBloc, ReviewState>(
      builder: (context, state) {
        if (state is ReviewsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ReviewsLoaded) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.reviews.length,
            itemBuilder: (context, index) {
              final Review review = state.reviews[index];
              return ReviewListItem(review: review);
            },
          );
        } else {
          return const Center(child: Text('Failed to load reviews'));
        }
      },
    );
  }
}