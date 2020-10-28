import 'package:flutter/material.dart';
import 'package:learn_fetch_api/provider/movie_list_view_holder.dart';
import 'package:provider/provider.dart';

import 'movie_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies",
      home: ChangeNotifierProvider(
        create: (context) => MovieListViewHolder(),
        child: MovieListPage(),
      ),
    );
  }
}
