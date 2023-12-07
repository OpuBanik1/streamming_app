import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:streaming_app/compontent/cast.dart';
import 'package:streaming_app/constant.dart';
import 'package:streaming_app/custom_http.dart';
import 'package:streaming_app/model/movie_model.dart';
import 'package:streaming_app/model/videos_model.dart';
import 'package:streaming_app/nav_bar/movies/component/movie_category.dart';
import 'package:streaming_app/reviews.dart';

import 'package:url_launcher/url_launcher.dart';

class Movie_details extends StatelessWidget {
  final Movie_model movie_model;
  const Movie_details({super.key, required this.movie_model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(movie_model.title.toString()),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      imageUrl: kImage + movie_model.backdropPath.toString(),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Video_model> videoList = snapshot.data ?? [];
                        if (videoList.isNotEmpty) {
                          return CircleAvatar(
                            child: IconButton(
                                onPressed: () async {
                                  if (!await launchUrl(Uri.parse(
                                      "https://WWW.youtube.com/embed/${videoList[0].key}"))) {
                                    throw Exception('Could nor launch');
                                  }
                                },
                                icon: Icon(Icons.play_circle)),
                          );
                        }
                      }
                      return CircularProgressIndicator();
                    },
                    future: Custom_http.getVideos(
                        movie_model.id ?? 0, ProgramType.movie),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                movie_model.title.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RatingBarIndicator(
                      rating: movie_model.voteAverage ?? 0,
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
                  Text(movie_model.voteAverage == null
                      ? ""
                      : movie_model.voteAverage.toString()),
                  Spacer(),
                  Text(
                    "Relased " + '${movie_model.releaseDate}',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                movie_model.overview.toString(),
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Review",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Container(
                height: 100,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Reviews()));
                    },
                    icon: Icon(
                      Icons.reviews,
                      size: 50,
                    )),
              ),
              Text("Cast", style: TextStyle(fontSize: 20, color: Colors.white)),
              SizedBox(
                height: 200,
                child: Cast(
                  id: movie_model.id ?? 0,
                  type: ProgramType.movie,
                ),
              ),
              Text(
                'Similar Movies',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                  height: 200,
                  child: MovieCategory(
                    movieType: MovieType.similar,
                    movie_id: movie_model.id ?? 0,
                  )),
              // Stack(
              //   children: [
              //     Positioned(
              //         top: 600,
              //         bottom: 80,
              //         right: 20,
              //         child: Container(
              //           height: 80,
              //           width: 80,
              //           child: Icon(
              //             Icons.reviews,
              //           ),
              //         ))
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
