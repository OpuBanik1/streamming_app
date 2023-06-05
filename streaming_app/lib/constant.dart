import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const baseUrl = 'https://api.themoviedb.org/3/movie/';
const knowPlaying = 'now_playing';
const kairingToday = 'airing_today';
const KonTheAir = 'on_the_air';
const kpopular = 'popular';
const ktopRated = 'top_rated';
const kupComing = 'upcoming';
const Kvideos = '/videos';
const Ksimilar = '/similar';
const kImage = 'https://image.tmdb.org/t/p/w500';

const tvBase = 'https://api.themoviedb.org/3/tv/';

final spinkit = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Colors.black : Colors.white,
      ),
    );
  },
);
