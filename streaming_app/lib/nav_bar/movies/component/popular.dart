import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:streaming_app/constant.dart';
import 'package:streaming_app/custom_http.dart';
import 'package:streaming_app/model/movie_model.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(15),
      height: 200,
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Movie_model>? popularData = snapshot.data ?? [];
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularData.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(right: 5),
                    width: 200,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            height: MediaQuery.of(context).size.height,
                            fit: BoxFit.cover,
                            imageUrl: kImage +
                                popularData[index].posterPath.toString(),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Text("${popularData[index].title}")
                      ],
                    ),
                  );
                });
          }
          if (snapshot.hasError) {
            return Text('Something has error');
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
        future: Custom_http.getMovies(MovieType.popular),
      ),
    );
  }
}
