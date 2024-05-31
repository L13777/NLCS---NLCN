// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: ListView(
        children: [
          Center(
            child: Text("Search Page"),
          ),
          Icon(Icons.search)
        ],
      ),
    );
  }
}
