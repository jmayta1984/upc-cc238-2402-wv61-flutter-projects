import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/domain/review.dart';

class ReviewListItem extends StatelessWidget {
  const ReviewListItem({super.key, required this.review});
  final Review review;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      review.avatarPath,
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.person,
                        color: Colors.white70,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    review.author,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                review.content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: Stack(
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.yellow.shade800,
                    size: 30,
                  ),
                  Positioned.fill(
                      child: Center(
                          child: Text(
                    review.rating.toStringAsFixed(0),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
