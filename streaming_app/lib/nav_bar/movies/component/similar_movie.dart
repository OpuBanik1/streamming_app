// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:streaming_app/constant.dart';
// import 'package:streaming_app/custom_http.dart';
// import 'package:streaming_app/model/movie_model.dart';
// import 'package:streaming_app/model/similar_show_model.dart';

// // ignore: must_be_immutable
// class SimilarMovies extends StatelessWidget {
//   final Movie_model movie_model;
//   int id;
//   SimilarMovies({super.key, required this.movie_model, required this.id});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         FutureBuilder(
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               List<Movie_model> similarList = snapshot.data??[];
//               // print('aaaaaaaaaaaaaaaaaaaaaaaaaaa${similarList}');

//               return ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   shrinkWrap: true,
//                   itemCount: similarList.length,
//                   itemBuilder: (Context, index) {
//                     print(similarList[index]);
//                     return Container(
//                       height: 140,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: CachedNetworkImage(
//                           height: 120,
//                           fit: BoxFit.cover,
//                           imageUrl: kImage +
//                               similarList[index].backdropPath.toString(),
//                           placeholder: (context, url) =>
//                               CircularProgressIndicator(),
//                           errorWidget: (context, url, error) =>
//                               Icon(Icons.error),
//                         ),
//                       ),
//                     );
//                   });
//             }
//             return CircularProgressIndicator();
//           },
//           future: Custom_http.getMovies(id, MovieType.),
//         )
//       ],
//     );
//   }
// }
