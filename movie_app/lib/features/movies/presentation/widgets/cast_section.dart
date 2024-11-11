import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/presentation/bloc/cast_bloc.dart';
import 'package:movie_app/features/movies/presentation/bloc/cast_event.dart';
import 'package:movie_app/features/movies/presentation/widgets/cast_list.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key, required this.movieId});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cast',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        SizedBox(
            height: 170,
            child: BlocProvider(
              create: (context) => CastBloc()..add(CastLoad(movieId: movieId)),
              child: const CastList(),
            )),
      ],
    );
  }
}
