import 'package:movie_app/core/app_constants.dart';

enum MovieEnum {
  popular(title: 'Popular', path: AppConstants.popularPath),
  topRated(title: 'Top rated', path: AppConstants.topRatedPath),
  upcoming(title: 'Upcoming', path: AppConstants.upcomingPath),
  nowPlaying(title: 'Now playing', path: AppConstants.nowPlayingPath);

  final String title;
  final String path;
  const MovieEnum({required this.title, required this.path});
}
