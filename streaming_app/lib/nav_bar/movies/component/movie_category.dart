import 'package:flutter/material.dart';
import 'package:streaming_app/constant.dart';
import 'package:streaming_app/custom_http.dart';
import 'package:streaming_app/model/movie_model.dart';
import 'package:streaming_app/nav_bar/movies/component/movie_list_item.dart';

class MovieCategory extends StatefulWidget {
  final MovieType movieType;
  final int movie_id;
  const MovieCategory({super.key, required this.movieType, this.movie_id = 0});

  @override
  State<MovieCategory> createState() => _MovieCategoryState();
}

class _MovieCategoryState extends State<MovieCategory> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Movie_model> movieList = snapshot.data ?? [];
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Movie_listItem(
                  movie_model: movieList[index],
                );
              });
        }
        return spinkit;
      },
      future: Custom_http.getMovies(widget.movieType, movieId: widget.movie_id),
    );
  }
}
