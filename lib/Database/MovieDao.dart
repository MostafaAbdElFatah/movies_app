import 'package:movies_app/Model/Movies.dart';
import 'package:floor/floor.dart';

@dao
abstract class MovieDao {
  @Query('SELECT * FROM movie WHERE id = :id')
  Future<MovieInfo> findMovieById(int id);

  @Query('SELECT * FROM movie WHERE movie = :id')
  Future<MovieInfo> findMovieByName(String id);

  @Query('SELECT * FROM movie')
  Future<List<MovieInfo>> findAllMovies();

  @Query('SELECT * FROM movie')
  Stream<List<MovieInfo>> findAllMoviesAsStream();

  @insert
  Future<void> insertMovie(MovieInfo movie);

  @insert
  Future<void> insertMovies(List<MovieInfo> movies);

  @update
  Future<void> updateMovie(MovieInfo movie);

  @update
  Future<void> updateMovies(List<MovieInfo> movie);

  @delete
  Future<void> deleteMovie(MovieInfo movie);

  @delete
  Future<void> deleteMovies(List<MovieInfo> movies);

  @Query('DELETE FROM movie')
  Future<void> deleteAllMovies();
}