import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/domain/cast.dart';

class CastListItem extends StatelessWidget {
  const CastListItem({super.key, required this.cast});
  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              cast.profilePath,
              width: 100,
              height: 130,
              fit: BoxFit.cover,
              errorBuilder:(context, error, stackTrace) => const SizedBox(
                width: 100,
                height: 130,
                child: Center(
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
          Text(
            cast.name,
             style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
          ),
        ],
      ),
    );
  }
}

