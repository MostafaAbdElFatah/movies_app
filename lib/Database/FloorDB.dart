import 'dart:async';
import 'MovieDao.dart';
import 'package:movies_app/Model/Movies.dart';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'FloorDB.g.dart';

///flutter packages pub run build_runner build

@Database(version: 1, entities: [MovieInfo])
abstract class FlutterDatabase extends FloorDatabase {
  MovieDao get movieDao;
}


class DatabaseManager{

  static MovieDao _dao;
  static DatabaseManager _manager;

  DatabaseManager._createInstance();

  factory DatabaseManager() {
    if (_manager == null) {
      _manager = DatabaseManager._createInstance();
    }
    return _manager;
  }

  Future<MovieDao> get dao async{
    if (_dao == null) {
      _dao = await _getShared();
    }
    return _dao;
  }
  Future<MovieDao> _getShared() async{
    final database = await $FloorFlutterDatabase
        .databaseBuilder('notes_database.db')
        .build();
    final dao = database.movieDao;
    return dao;
  }

  Future<void> insertMovie(MovieInfo movie) async {
    MovieDao dao = await this.dao;
    return await dao.insertMovie(movie);
  }

  Future<void>  insertMovies(List<MovieInfo> movies) async {
    MovieDao dao = await this.dao;
    return await dao.insertMovies(movies);
  }

  Future<MovieInfo> getMovieByID(int id) async {
    MovieDao dao = await this.dao;
    return await dao.findMovieById(id);
  }

  Future<MovieInfo> getMovieByName(String id) async {
    MovieDao dao = await this.dao;
    return await dao.findMovieByName(id);
  }

  Future<List<MovieInfo>> getMovies() async {
    MovieDao dao = await this.dao;
    return await dao.findAllMovies();
  }

  Future<bool> isHasRows() async {
    MovieDao dao = await this.dao;
    var rows =  await dao.findAllMovies();
    if ( rows == null)
      return false;
    else if (rows.length <= 0)
      return false;
    else
      return true;
  }


  Future<void>  updateMovie(MovieInfo movie) async{
    MovieDao dao = await this.dao;
    return await dao.updateMovie(movie);
  }

  Future<void>  deleteMovie(MovieInfo movie) async{
    MovieDao dao = await this.dao;
    return await dao.deleteMovie(movie);
  }

  Future<void>  deleteAllMovies() async {
    MovieDao dao = await this.dao;
    return await dao.deleteAllMovies();
  }



}