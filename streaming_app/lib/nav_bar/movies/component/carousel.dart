import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:streaming_app/constant.dart';
import 'package:streaming_app/model/movie_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:streaming_app/nav_bar/movies/component/movie_details.dart';

// ignore: must_be_immutable
class MovieCarousel extends StatefulWidget {
  List<Movie_model> movieList;
  MovieCarousel({super.key, required this.movieList});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: widget.movieList.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Movie_details(
                        movie_model: widget.movieList[itemIndex])));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  width: double.infinity,
                  fit: BoxFit.fill,
                  imageUrl: kImage +
                      widget.movieList[itemIndex].posterPath.toString(),
                  placeholder: (context, url) => spinkit,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
        options: CarouselOptions(
          height: 250,
          aspectRatio: 16 / 9,
          enlargeCenterPage: true,
          autoPlay: true,
        ));
  }
}
