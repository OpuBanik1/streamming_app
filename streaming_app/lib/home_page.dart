import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:streaming_app/drawer/my_drawer.dart';
import 'package:streaming_app/movie_homepage.dart';
import 'package:streaming_app/search/auto_searchbar.dart';
import 'package:streaming_app/tv_homepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();
  List pages = [Movie_homepage(), tv_homepage()];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scafoldKey,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                _scafoldKey.currentState!.openDrawer();
              },
              icon: Icon(Icons.menu)),
          title: Text(
            'Stremy',
            style: TextStyle(fontSize: 25, color: Colors.redAccent),
          ),
          centerTitle: true,
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AutoSuggestSearchBar()));
                    },
                    icon: Icon(Icons.search)),
                SizedBox(
                  width: 3,
                ),
                IconButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    icon: Icon(Icons.logout))
              ],
            )
          ],
        ),
        drawer: MyDrawer(),
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
