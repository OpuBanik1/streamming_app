import 'package:flutter/material.dart';
import 'package:streaming_app/compontent/cast_list.dart';
import 'package:streaming_app/constant.dart';
import 'package:streaming_app/custom_http.dart';
import 'package:streaming_app/model/cast_model.dart';

class Cast extends StatefulWidget {
  final int id;
  final ProgramType type;
  const Cast({super.key, required this.id, required this.type});

  @override
  State<Cast> createState() => _CastState();
}

class _CastState extends State<Cast> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CastModel> castList = snapshot.data ?? [];
          return ListView.builder(
              itemCount: castList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CastList(castModel: castList[index]);
              });
        }
        return spinkit;
      },
      future: Custom_http.getCasts(widget.id, widget.type),
    );
  }
}
