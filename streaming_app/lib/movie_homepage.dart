import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:streaming_app/constant.dart';

import 'package:streaming_app/custom_http.dart';
import 'package:streaming_app/model/movie_model.dart';
import 'package:streaming_app/nav_bar/movies/component/carousel.dart';
import 'package:streaming_app/nav_bar/movies/component/movie_category.dart';

class Movie_homepage extends StatefulWidget {
  const Movie_homepage({super.key});

  @override
  State<Movie_homepage> createState() => _Movie_homepageState();
}

class _Movie_homepageState extends State<Movie_homepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder(
            builder: (context, sanpshot) {
              // if (sanpshot.connectionState == ConnectionState.waiting) {
              //   return Center(
              //     child: CircularProgressIndicator(),
              //   );
              // }
              if (sanpshot.hasData) {
                List<Movie_model> movieData = sanpshot.data ?? [];
                return MovieCarousel(movieList: movieData);
              }
              if (sanpshot.hasError) {
                return Text('something error');
              }
              return Center(
                child: spinkit,
              );
            },
            future: Custom_http.getMovies(MovieType.now_playing),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Popular',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 200,
                    child: MovieCategory(movieType: MovieType.popular),
                  ),
                  Text(
                    'TopRated',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 200,
                    child: MovieCategory(movieType: MovieType.top_rated),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'UpComing',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 200,
                    child: MovieCategory(movieType: MovieType.upComing),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
