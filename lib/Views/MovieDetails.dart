import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:movies_app/Views/FavoriteMovies.dart';
import 'package:movies_app/Model/Movies.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/Database/FloorDB.dart';

class MovieDetails extends StatefulWidget {
  Movie movie;

  MovieDetails({@required this.movie});

  @override
  _MovieDetailsState createState() => _MovieDetailsState(movie: movie);
}

class _MovieDetailsState extends State<MovieDetails> {
  Movie movie;
  bool isFavorite = false;
  final _key = UniqueKey();
  WebViewController _controller;
  final dbManager = DatabaseManager();

  _MovieDetailsState({@required this.movie});

  @override
  void initState() {
    super.initState();
    dbManager.getMovieByName(this.movie.movie).then((movie) {
      if (movie == null) {
        setState(() {
          isFavorite = false;
        });
      } else {
        setState(() {
          isFavorite = true;
        });
      }
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
        onPressed: _saveMovieInDatabase,
        backgroundColor: Colors.white,
        child: isFavorite
            ? Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
      ),
      body: _getBodyContent(),
    );
  }

  void _saveMovieInDatabase() {
    var movieInfo = MovieInfo(
        movie: this.movie.movie,
        year: this.movie.year,
        rating: this.movie.rating,
        duration: this.movie.duration,
        director: this.movie.director,
        tagline: this.movie.tagline,
        cast: _getStringCast(this.movie.cast),
        image: this.movie.image,
        story: this.movie.story,
        tralier: this.movie.tralier);

    dbManager.getMovieByName(this.movie.movie).then((movie) {
      if (movie == null) {
        dbManager.insertMovie(movieInfo).then((flag){
          setState(() {
            isFavorite = true;
          });
        });
      } else {
        dbManager.deleteMovie(movie).then((flag){
          setState(() {
            isFavorite = false;
          });
        });
      }
    });
  }

  Widget _getBodyContent() {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                movie.movie,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              height: 10,
            ),
//            YoutubePlayer(
//              key: _key,
//              context: context,
//              videoId: "iLnmTe5Q2Qw",
//              flags: YoutubePlayerFlags(
//                autoPlay: true,
//                showVideoProgressIndicator: true,
//              ),
//              videoProgressIndicatorColor: Colors.amber,
//              progressColors: ProgressColors(
//                playedColor: Colors.amber,
//                handleColor: Colors.amberAccent,
//              ),
//              onPlayerInitialized: (controller) {
////                  _controller = controller;
////                  _controller.addListener(listener);
//              },
//            ),
            AspectRatio(
              aspectRatio: 4 / 3,
              child: WebView(
                  key: _key,
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: Uri.dataFromString(movie.tralier,
                          mimeType: 'text/html',
                          encoding: Encoding.getByName('utf-8'))
                      .toString()),
            ),
            Container(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                movie.tagline,
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Year: " + movie.year.toString(),
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Duration: " + movie.duration.toString(),
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Direcctor: " + movie.director,
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Center(
              child: SmoothStarRating(
                  allowHalfRating: true,
                  starCount: 5,
                  rating: movie.rating,
                  size: 40,
                  color: Colors.red,
                  borderColor: Colors.red,
                  spacing: 0.0),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                _getStringCast(movie.cast),
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Container(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                movie.story,
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ],
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
            // return to home Page
            Navigator.pop(context,true);
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
          child: Text("Home"),
        ),
//        PopupMenuItem(
//          value: 1,
//          child: Text("Refresh"),
//        ),
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
}
