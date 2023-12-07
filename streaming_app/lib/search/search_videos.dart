import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:streaming_app/constant.dart';
import 'package:streaming_app/custom_http.dart';

import '../model/movie_model.dart';
import '../nav_bar/movies/component/movie_details.dart';

// ignore: must_be_immutable
class Search_videos extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  Search_videos({super.key, required this.searchController});
  String kImage = 'https://image.tmdb.org/t/p/w500';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Movie_model> movieData = snapshot.data ?? [];
              // print("movie lenght is ${movieData.length}");
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movieData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Movie_details(movie_model: movieData[index])));
                      },
                      child: Center(
                        child: Container(
                          height: 400,
                          padding: EdgeInsets.only(right: 5),
                          width: 200,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  height: 200,
                                  fit: BoxFit.cover,
                                  imageUrl: kImage +
                                      movieData[index].posterPath.toString(),
                                  placeholder: (context, url) => spinkit,
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                movieData[index].title.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                      rating: movieData[index].voteAverage ?? 0,
                                      itemCount: 5,
                                      direction: Axis.horizontal,
                                      itemSize: 15,
                                      itemBuilder: (context, index) {
                                        return Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        );
                                      }),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    movieData[index].voteAverage == null
                                        ? ""
                                        : movieData[index]
                                            .voteAverage
                                            .toString(),
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
            // if (snapshot.data == null) {
            //   return Text(
            //     "No data",
            //     style: TextStyle(fontSize: 20),
            //   );
            // }
            return Center(
              child: spinkit,
            );
          },
          future: Custom_http.search(searchController.text)),
    );
  }
}
