import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:streaming_app/constant.dart';
import 'package:streaming_app/model/movie_model.dart';
import 'package:http/http.dart' as http;

import 'package:streaming_app/model/tv_model.dart';
import 'package:streaming_app/model/videos_model.dart';

import 'model/cast_model.dart';

enum MovieType { now_playing, popular, top_rated, upComing, similar }

enum TvType { on_the_air, airing_today, popular, top_rated, similar }

enum ProgramType { tv, movie }

class Custom_http {
  static Future<List<Movie_model>> getMovies(MovieType type,
      {int movieId = 0}) async {
    List<Movie_model> movieList = [];
    Movie_model movie_model;

    String link = '';
    if (type == MovieType.now_playing) {
      link = baseUrl + knowPlaying;
    } else if (type == MovieType.popular) {
      link = baseUrl + kpopular;
    } else if (type == MovieType.top_rated) {
      link = baseUrl + ktopRated;
    } else if (type == MovieType.upComing) {
      link = baseUrl + kupComing;
    } else {
      link = baseUrl + movieId.toString() + Ksimilar;
    }
    try {
      var response = await http
          .get(Uri.parse(link + '?api_key=9d36bba22caf86253e8ff64fec79afd3'));
      var data = jsonDecode(response.body);
      // print('wwwwwwwwwwwwwwwwwwwwwwwwwwwww $type\n$data');

      if (response.statusCode == 200) {
        for (var i in data['results']) {
          movie_model = Movie_model.fromJson(i);

          movieList.add(movie_model);
        }
        return movieList;
      } else {
        throw (Text('No movie found'));
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<TvModel>> getTvs(TvType type, {int tv_id = 0}) async {
    List<TvModel> tvList = [];
    TvModel tvModel;

    String link = '';
    if (type == TvType.airing_today) {
      link = tvBase + kairingToday;
    } else if (type == TvType.popular) {
      link = tvBase + kpopular;
    } else if (type == TvType.top_rated) {
      link = tvBase + ktopRated;
    } else if (type == TvType.on_the_air) {
      link = tvBase + KonTheAir;
    } else {
      link = tvBase + tv_id.toString() + Ksimilar;
    }
    try {
      var response = await http
          .get(Uri.parse(link + '?api_key=9d36bba22caf86253e8ff64fec79afd3'));
      var data = jsonDecode(response.body);
      // print('wwwwwwwwwwwwwwwwwwwwwwwwwwwww $type\n$data');

      if (response.statusCode == 200) {
        for (var i in data['results']) {
          tvModel = TvModel.fromJson(i);

          tvList.add(tvModel);
        }
        return tvList;
      } else {
        throw (Text('No movie found'));
      }
    } catch (e) {
      throw e.toString();
    }
  }

  // static Future<List<Similar_show_model>> getSimilar(
  //     int id, ProgramType type) async {
  //   List<Similar_show_model> SimilarvideoList = [];
  //   Similar_show_model similar_show_model;

  //   String link = '';
  //   if (type == ProgramType.movie) {
  //     link = baseUrl + id.toString() + Ksimilar;
  //   } else if (type == ProgramType.tv) {
  //     link = tvBase + id.toString() + Ksimilar;
  //   }
  //   try {
  //     var response = await http
  //         .get(Uri.parse(link + '?api_key=9d36bba22caf86253e8ff64fec79afd3'));
  //     var data = jsonDecode(response.body);
  //     // print('wwwwwwwwwwwwwwwwwwwwwwwwwwwww $type\n$data');

  //     if (response.statusCode == 200) {
  //       for (var i in data['results']) {
  //         similar_show_model = Similar_show_model.fromJson(i);

  //         SimilarvideoList.add(similar_show_model);
  //       }
  //       return SimilarvideoList;
  //     } else {
  //       throw (Text('No movie found'));
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  static Future<List<Video_model>> getVideos(int id, ProgramType type) async {
    List<Video_model> videoList = [];
    Video_model video_model;

    String link = '';
    if (type == ProgramType.movie) {
      link = baseUrl + id.toString() + Kvideos;
    } else if (type == ProgramType.tv) {
      link = tvBase + id.toString() + Kvideos;
    }
    try {
      var response = await http
          .get(Uri.parse(link + '?api_key=9d36bba22caf86253e8ff64fec79afd3'));
      var data = jsonDecode(response.body);
      // print('wwwwwwwwwwwwwwwwwwwwwwwwwwwww $type\n$data');

      if (response.statusCode == 200) {
        for (var i in data['results']) {
          video_model = Video_model.fromJson(i);

          videoList.add(video_model);
        }
        return videoList;
      } else {
        throw (Text('No movie found'));
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<CastModel>> getCasts(int id, ProgramType type) async {
    List<CastModel> castList = [];
    CastModel castModel;

    String link = '';
    if (type == ProgramType.movie) {
      link = baseUrl + id.toString() + kcast;
    } else if (type == ProgramType.tv) {
      link = tvBase + id.toString() + kcast;
    }
    try {
      var response = await http
          .get(Uri.parse(link + '?api_key=9d36bba22caf86253e8ff64fec79afd3'));
      var data = jsonDecode(response.body);
      // print('wwwwwwwwwwwwwwwwwwwwwwwwwwwww $type\n$data');

      if (response.statusCode == 200) {
        for (var i in data['cast']) {
          castModel = CastModel.fromJson(i);

          castList.add(castModel);
        }
        return castList;
      } else {
        throw (Text('No cast found'));
      }
    } catch (e) {
      throw (Text('problem image found'));
    }
  }

  static Future<List<Movie_model>> search(String query) async {
    List<Movie_model> movieList = [];
    Movie_model movie_model;
    String searchUrl = 'https://api.themoviedb.org/3/search/movie?query=$query';

    const token =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZDM2YmJhMjJjYWY4NjI1M2U4ZmY2NGZlYzc5YWZkMyIsInN1YiI6IjY0NThhMmMyNmFhOGUwMDBlNGJjODcyYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tRENbIJeNoIzYTKVF91TSibZkaYtRvdKmAyp13vI_uA';
    // print('aaaaaaaaaaaaaaaaaaaaaaa $query');
    try {
      var response = await http.get(Uri.parse(searchUrl), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      var data = jsonDecode(response.body);
      print('wwwwwwwwwwwwwwwwwwwwwwwwwwwww $data');

      if (response.statusCode == 200) {
        for (var i in data['results']) {
          movie_model = Movie_model.fromJson(i);

          movieList.add(movie_model);
        }
        print("aaaaaaa ${movieList.length}");
        return movieList;
      } else {
        throw (Text('No movie found'));
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
