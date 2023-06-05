import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:streaming_app/custom_http.dart';
import 'package:streaming_app/model/tv_model.dart';
import 'package:streaming_app/nav_bar/tv/component/tv_carousel.dart';
import 'package:streaming_app/nav_bar/tv/component/tv_category.dart';

class tv_homepage extends StatefulWidget {
  const tv_homepage({super.key});

  @override
  State<tv_homepage> createState() => _tv_homepageState();
}

class _tv_homepageState extends State<tv_homepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<TvModel> tvData = snapshot.data ?? [];
                return TvCarousel(tvList: tvData);
              }
              if (snapshot.hasError) {
                return Text("Tv carrousel found no data");
              }
              return Center(child: CircularProgressIndicator());
            },
            future: Custom_http.getTvs(TvType.airing_today),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Popular Tv shows",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 200,
                  child: TvCategory(
                    tvType: TvType.popular,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Top Rated",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 200,
                  child: TvCategory(
                    tvType: TvType.top_rated,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "On the Air",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 200,
                  child: TvCategory(
                    tvType: TvType.on_the_air,
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
