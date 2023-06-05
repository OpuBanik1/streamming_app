import 'package:flutter/material.dart';
import 'package:streaming_app/constant.dart';
import 'package:streaming_app/custom_http.dart';
import 'package:streaming_app/model/tv_model.dart';
import 'package:streaming_app/nav_bar/tv/component/tv_list_item.dart';

class TvCategory extends StatefulWidget {
  final TvType tvType;
  final int id;
  const TvCategory({super.key, required this.tvType, this.id = 0});

  @override
  State<TvCategory> createState() => _TvCategoryState();
}

class _TvCategoryState extends State<TvCategory> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<TvModel> tvList = snapshot.data ?? [];
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TvList_item(
                  tvModel: tvList[index],
                );
              });
        }
        if (snapshot.hasError) {
          return Text("sorry something error occured");
        }
        return Center(
          child: spinkit,
        );
      },
      future: Custom_http.getTvs(widget.tvType, tv_id: widget.id),
    );
  }
}
