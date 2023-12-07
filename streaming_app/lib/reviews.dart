import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  TextEditingController reviewController = TextEditingController();
  review() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("review", reviewController.toString());
    reviewController.clear();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Done'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          height: double.infinity,
          width: 250,
          child: Column(
            children: [
              TextField(
                controller: reviewController,
                decoration: InputDecoration(
                    labelText: "Enter your review",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 15)),
              ),
              TextButton(
                  onPressed: () {
                    review();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
