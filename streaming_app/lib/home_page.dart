import 'package:flutter/material.dart';
import 'package:streaming_app/movie_homepage.dart';
import 'package:streaming_app/tv_homepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [Movie_homepage(), tv_homepage()];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          title: Text('Streaming App'),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                currentPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
              BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Tv'),
            ]),
        body: pages[currentPage]);
  }
}
