import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:streaming_app/constant.dart';
import 'package:streaming_app/custom_http.dart';
import 'package:streaming_app/model/tv_model.dart';
import 'package:streaming_app/model/videos_model.dart';
import 'package:streaming_app/nav_bar/tv/component/tv_category.dart';
import 'package:url_launcher/url_launcher.dart';

class Tv_details extends StatefulWidget {
  final TvModel tvModel;
  const Tv_details({super.key, required this.tvModel});

  @override
  State<Tv_details> createState() => _Tv_detailsState();
}

class _Tv_detailsState extends State<Tv_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tvModel.name.toString()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                      imageUrl: kImage + widget.tvModel.backdropPath.toString(),
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
                                      throw Exception('Could not launch tv');
                                    }
                                  },
                                  icon: Icon(Icons.play_circle)));
                        }
                      }
                      return CircularProgressIndicator();
                    },
                    future: Custom_http.getVideos(
                        widget.tvModel.id ?? 0, ProgramType.tv),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.tvModel.name.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Row(
                children: [
                  RatingBarIndicator(
                      rating: widget.tvModel.voteAverage ?? 0,
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
                  // Text(
                  //   widget.tvModel.voteAverage == null
                  //       ? ''
                  //       : widget.tvModel.voteAverage.toString(),
                  //   style: TextStyle(fontSize: 20, color: Colors.white),
                  // ),
                  Spacer(),
                  Text(
                    "Relased " + '${widget.tvModel.firstAirDate}',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.tvModel.overview.toString(),
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              SizedBox(
                height: 200,
                child: TvCategory(
                  tvType: TvType.similar,
                  id: widget.tvModel.id ?? 0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
