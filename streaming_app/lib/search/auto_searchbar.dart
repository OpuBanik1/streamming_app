import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:streaming_app/model/movie_model.dart';
import 'package:streaming_app/search/search_videos.dart';
import 'movie_list.dart';

class AutoSuggestSearchBar extends StatefulWidget {
  @override
  _AutoSuggestSearchBarState createState() => _AutoSuggestSearchBarState();
}

class _AutoSuggestSearchBarState extends State<AutoSuggestSearchBar> {
  // final List<String> suggestions = [
  //   'Apple',
  //   'Banana',
  //   'Cherry',
  //   'Date',
  //   'Grapes',
  //   // Add more suggestions here
  // ];
  List<Movie_model> movieList = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TypeAheadField(
              suggestionsCallback: (pattern) async {
                // Filter the suggestions based on the user input (pattern)
                List<String> filteredSuggestions = suggestions
                    .where((suggestion) => suggestion
                        .toLowerCase()
                        .contains(pattern.toLowerCase()))
                    .toList();

                // Return only the first 15 suggestions
                return filteredSuggestions.take(15).toList();
              },
              // TypeAheadField(
              //   suggestionsCallback: (pattern) async {
              //     return suggestions.where((suggestion) =>
              //         suggestion.toLowerCase().contains(pattern.toLowerCase()));
              //   },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },

              onSuggestionSelected: (suggestion) {
                // Handle when a suggestion is tapped
                _searchController.text =
                    suggestion; // Fill the search text with the selected suggestion
              },
              textFieldConfiguration: TextFieldConfiguration(
                controller:
                    _searchController, // Use the TextEditingController here
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 46),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Search_videos(searchController: _searchController)));
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
