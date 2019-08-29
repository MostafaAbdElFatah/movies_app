// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FloorDB.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorFlutterDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder databaseBuilder(String name) =>
      _$FlutterDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FlutterDatabaseBuilder(null);
}

class _$FlutterDatabaseBuilder {
  _$FlutterDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  /// Adds migrations to the builder.
  _$FlutterDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Creates the database and initializes it.
  Future<FlutterDatabase> build() async {
    final database = _$FlutterDatabase();
    database.database = await database.open(name ?? ':memory:', _migrations);
    return database;
  }
}

class _$FlutterDatabase extends FlutterDatabase {
  _$FlutterDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao _movieDaoInstance;

  Future<sqflite.Database> open(String name, List<Migration> migrations) async {
    final path = join(await sqflite.getDatabasesPath(), name);

    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);
      },
      onCreate: (database, _) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `movie` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `movie` TEXT, `year` INTEGER, `rating` REAL, `duration` TEXT, `director` TEXT, `tagline` TEXT, `cast` TEXT, `image` TEXT, `story` TEXT, `tralier` TEXT)');
      },
    );
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _movieInfoInsertionAdapter = InsertionAdapter(
            database,
            'movie',
            (MovieInfo item) => <String, dynamic>{
                  'id': item.id,
                  'movie': item.movie,
                  'year': item.year,
                  'rating': item.rating,
                  'duration': item.duration,
                  'director': item.director,
                  'tagline': item.tagline,
                  'cast': item.cast,
                  'image': item.image,
                  'story': item.story,
                  'tralier': item.tralier
                },
            changeListener),
        _movieInfoUpdateAdapter = UpdateAdapter(
            database,
            'movie',
            'id',
            (MovieInfo item) => <String, dynamic>{
                  'id': item.id,
                  'movie': item.movie,
                  'year': item.year,
                  'rating': item.rating,
                  'duration': item.duration,
                  'director': item.director,
                  'tagline': item.tagline,
                  'cast': item.cast,
                  'image': item.image,
                  'story': item.story,
                  'tralier': item.tralier
                },
            changeListener),
        _movieInfoDeletionAdapter = DeletionAdapter(
            database,
            'movie',
            'id',
            (MovieInfo item) => <String, dynamic>{
                  'id': item.id,
                  'movie': item.movie,
                  'year': item.year,
                  'rating': item.rating,
                  'duration': item.duration,
                  'director': item.director,
                  'tagline': item.tagline,
                  'cast': item.cast,
                  'image': item.image,
                  'story': item.story,
                  'tralier': item.tralier
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final _movieMapper = (Map<String, dynamic> row) => MovieInfo(
      id:row['id'] as int,
      movie:row['movie'] as String,
      year:row['year'] as int,
      rating:row['rating'] as double,
      duration:row['duration'] as String,
      director:row['director'] as String,
      tagline:row['tagline'] as String,
      cast:row['cast'] as String,
      image:row['image'] as String,
      story:row['story'] as String,
      tralier:row['tralier'] as String);

  final InsertionAdapter<MovieInfo> _movieInfoInsertionAdapter;

  final UpdateAdapter<MovieInfo> _movieInfoUpdateAdapter;

  final DeletionAdapter<MovieInfo> _movieInfoDeletionAdapter;

  @override
  Future<MovieInfo> findMovieById(int id) async {
    return _queryAdapter.query('SELECT * FROM movie WHERE id = ?',
        arguments: <dynamic>[id], mapper: _movieMapper);
  }

  @override
  Future<MovieInfo> findMovieByName(String id) async {
    return _queryAdapter.query('SELECT * FROM movie WHERE movie = ?',
        arguments: <dynamic>[id], mapper: _movieMapper);
  }

  @override
  Future<List<MovieInfo>> findAllMovies() async {
    return _queryAdapter.queryList('SELECT * FROM movie', mapper: _movieMapper);
  }

  @override
  Stream<List<MovieInfo>> findAllMoviesAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM movie',
        tableName: 'movie', mapper: _movieMapper);
  }

  @override
  Future<void> deleteAllMovies() async {
    await _queryAdapter.queryNoReturn('DELETE FROM movie');
  }

  @override
  Future<void> insertMovie(MovieInfo movie) async {
    await _movieInfoInsertionAdapter.insert(
        movie, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> insertMovies(List<MovieInfo> movies) async {
    await _movieInfoInsertionAdapter.insertList(
        movies, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updateMovie(MovieInfo movie) async {
    await _movieInfoUpdateAdapter.update(
        movie, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> updateMovies(List<MovieInfo> movie) async {
    await _movieInfoUpdateAdapter.updateList(
        movie, sqflite.ConflictAlgorithm.abort);
  }

  @override
  Future<void> deleteMovie(MovieInfo movie) async {
    await _movieInfoDeletionAdapter.delete(movie);
  }

  @override
  Future<void> deleteMovies(List<MovieInfo> movies) async {
    await _movieInfoDeletionAdapter.deleteList(movies);
  }
}
