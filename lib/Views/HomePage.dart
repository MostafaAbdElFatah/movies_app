import 'package:flutter/material.dart';
import 'FavoriteMovies.dart';
import 'MovieDetails.dart';
import 'package:progress_hud/progress_hud.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:movies_app/APIServices/APIsManager.dart';
import 'package:movies_app/Model/Movies.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  ProgressHUD _progressHUD;
  List<Movie> _moviesList = [];

  @override
  void initState() {
    super.initState();

    _progressHUD = new ProgressHUD(
      backgroundColor: Colors.black12,
      color: Colors.white,
      containerColor: Colors.black,
      borderRadius: 5.0,
      text: 'Loading...',
    );

    this._loadData();
  }

  void _loadData() {
    setState(() {
      _moviesList.clear();
      _isLoading = true;
    });
    APIsManager.getMovies().then((movies) {
      setState(() {
        _progressHUD.state.dismiss();
        _moviesList.clear();
        _moviesList.addAll(movies);
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        actions: <Widget>[
          _getPopMenu(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showFavoritePage,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),
      body: Stack(
        children: <Widget>[
          this._moviesList.length > 0 ? this._getMoviesList() : this._emptyList,
          _isLoading ? _progressHUD : Container(),
        ],
      ),
    );
  }

  final _emptyList = Center(
    child: Text(
      "No Movies Found",
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 30),
    ),
  );

  Widget _getMoviesList() {
    return ListView.builder(
        itemCount: _moviesList.length,
        itemBuilder: (context, index) {
          return _getMoviesListCell(index);
        });
  }

  Widget _getMoviesListCell(int index) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ListTile(
          onTap: () {
            _showMovieDetailsPage(index);
          },
          title: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Image.network(
                      _moviesList[index].image,
                      fit: BoxFit.cover,
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, top: 8, right: 8, bottom: 8),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          _moviesList[index].movie,
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          _moviesList[index].tagline,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Year: " + _moviesList[index].year.toString(),
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Duration: " + _moviesList[index].duration.toString(),
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Direcctor: " + _moviesList[index].director,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SmoothStarRating(
                    allowHalfRating: true,
                    starCount: 5,
                    rating: _moviesList[index].rating,
                    size: 40,
                    color: Colors.red,
                    borderColor: Colors.red,
                    spacing: 0.0),
//                FlutterRatingBar(
//                  initialRating: 3,
//                  fillColor: Colors.red,
//                  borderColor: Colors.red,
//                  allowHalfRating: true,
//                  onRatingUpdate: (rating){},
//                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    _getStringCast(_moviesList[index].cast),
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Container(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    _moviesList[index].story,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getStringCast(List<Cast> castList) {
    String cast = "";
    for (var item in castList) cast += item.name + ", ";
    return cast.substring(0,cast.length - 2);
  }

  Widget _getPopMenu() {
    return PopupMenuButton<int>(
      onSelected: (index) {
        switch (index) {
          case 0:
            // refresh app
            _loadData();
            break;
          case 1:
            // open Favorite Movies Page app
            _showFavoritePage();
            break;
        }
      },
      icon: Icon(Icons.more_vert),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: Text("Refresh"),
        ),
        PopupMenuItem(
          value: 1,
          child: Text("Favorite Movies"),
        ),
      ],
    );
  }

  void _showFavoritePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FavoriteMovies();
    }));
  }

  void _showMovieDetailsPage(int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MovieDetails(movie: _moviesList[index]);
    }));
  }
}
