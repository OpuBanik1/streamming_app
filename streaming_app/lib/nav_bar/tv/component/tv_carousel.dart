import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:streaming_app/constant.dart';
import 'package:streaming_app/model/tv_model.dart';

// ignore: must_be_immutable
class TvCarousel extends StatefulWidget {
  List<TvModel> tvList = [];
  TvCarousel({super.key, required this.tvList});

  @override
  State<TvCarousel> createState() => _TvCarouselState();
}

class _TvCarouselState extends State<TvCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: widget.tvList.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageviewIndex) =>
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                width: double.infinity,
                fit: BoxFit.fill,
                imageUrl:
                    kImage + widget.tvList[itemIndex].posterPath.toString(),
                placeholder: (context, url) => spinkit,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
        options: CarouselOptions(
            height: 250,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            autoPlay: true));
  }
}
