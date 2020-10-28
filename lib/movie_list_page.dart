import 'package:flutter/material.dart';
import 'package:learn_fetch_api/provider/movie_list_view_holder.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // you can uncomment this to get all ironman movies when the page is loaded
    // Provider.of<MovieListViewHolder>(context, listen: false)
    //     .fetchMovies("ironman");
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MovieListViewHolder>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Movie"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _searchController,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    viewModel.fetchMovies(value);
                    _searchController.clear();
                  }
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none),
              ),
            ),
            Expanded(child: MovieList(movies: viewModel.movies))
          ],
        ),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<MovieViewModel> movies;

  MovieList({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.movies.length,
      itemBuilder: (context, index) {
        final movie = this.movies[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(movie.poster)),
                borderRadius: BorderRadius.circular(6)),
            width: 50,
            height: 100,
          ),
          title: Text(movie.title),
        );
      },
    );
  }
}
