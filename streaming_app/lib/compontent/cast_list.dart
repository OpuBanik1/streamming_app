import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:streaming_app/constant.dart';
import 'package:streaming_app/model/cast_model.dart';

class CastList extends StatelessWidget {
  final CastModel castModel;
  const CastList({super.key, required this.castModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Column(
        children: [
          CachedNetworkImage(
            imageBuilder: (context, ImageProvider) => Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: ImageProvider)),
            ),
            height: 140,
            fit: BoxFit.cover,
            imageUrl: kImage + castModel.profilePath.toString(),
            placeholder: (context, url) => spinkit,
            errorWidget: (context, url, error) => Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/image/img_notfound.png'),
                      fit: BoxFit.fill)),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            castModel.name.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            castModel.knownForDepartment.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
