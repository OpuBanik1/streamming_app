import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:streaming_app/constant.dart';
import 'package:streaming_app/model/tv_model.dart';
import 'package:streaming_app/nav_bar/tv/component/tv_details.dart';

class TvList_item extends StatelessWidget {
  final TvModel tvModel;
  const TvList_item({super.key, required this.tvModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Tv_details(tvModel: tvModel)));
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
                imageUrl: kImage + tvModel.posterPath.toString(),
                placeholder: (context, url) => spinkit,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              tvModel.name.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                RatingBarIndicator(
                    rating: tvModel.voteAverage ?? 0,
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
                  tvModel.voteAverage == null
                      ? ""
                      : tvModel.voteAverage.toString(),
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
