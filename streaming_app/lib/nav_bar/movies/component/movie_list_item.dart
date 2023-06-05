import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:streaming_app/constant.dart';
import 'package:streaming_app/model/movie_model.dart';
import 'package:streaming_app/nav_bar/movies/component/movie_details.dart';

class Movie_listItem extends StatelessWidget {
  final Movie_model movie_model;
  const Movie_listItem({super.key, required this.movie_model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Movie_details(movie_model: movie_model)));
      },
      child: Container(
        margin: EdgeInsets.all(5),
        width: 120,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                height: 140,
                fit: BoxFit.cover,
                imageUrl: kImage + movie_model.posterPath.toString(),
                placeholder: (context, url) => spinkit,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              movie_model.title.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
            ),
            Row(
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
                Text(
                  movie_model.voteAverage == null
                      ? ""
                      : movie_model.voteAverage.toString(),
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
