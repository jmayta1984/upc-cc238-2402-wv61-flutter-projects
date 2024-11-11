import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/domain/cast.dart';
import 'package:movie_app/features/movies/presentation/bloc/cast_bloc.dart';
import 'package:movie_app/features/movies/presentation/bloc/cast_state.dart';
import 'package:movie_app/features/movies/presentation/widgets/cast_list_item.dart';

class CastList extends StatelessWidget {
  const CastList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        if (state is CastLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CastLoaded) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.cast.length,
            itemBuilder: (context, index) {
              final Cast cast = state.cast[index];
              return CastListItem(cast: cast);
            },
          );
        } else {
          return const Center(child: Text('Failed to load cast'));
        }
      },
    );
  }
}