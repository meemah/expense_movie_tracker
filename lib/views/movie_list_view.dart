import 'package:expense_movie_tracker/model/movie_model.dart';
import 'package:expense_movie_tracker/utils/app_colors.dart';
import 'package:expense_movie_tracker/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_movie_tracker/viewmodels/movie_list_viewmodel.dart';
import 'package:expense_movie_tracker/networking/api_response.dart';
import '../custom_widgets/error_view.dart';

class MovieListView extends StatelessWidget {
  static const route = "/movieListView";
  @override
  Widget build(BuildContext context) {
    final _movieProvider = Provider.of<MovieListViewmodel>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: ListView(
            children: [
              _movieProvider.allMovies.status == Status.LOADING
                  ? Loading(
                      loadingMessage: "Loading",
                    )
                  : _movieProvider.allMovies.status == Status.ERROR
                      ? Error(
                          errorMessage: _movieProvider.allMovies.message,
                          onRetryPressed: () {
                            _movieProvider.fetchMovies();
                          },
                        )
                      : ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _movieProvider.allMovies.data.length,
                          itemBuilder: (ctx, index) {
                            MovieModel _movie =
                                _movieProvider.allMovies.data[index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _movie.title,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    MovieInfoContainer(
                                        title: "ID", value: _movie.id),
                                    kSizedBoxH10,
                                    Text(
                                      _movie.description,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    kSizedBoxH10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MovieInfoContainer(
                                            title: "Release Date",
                                            value: _movie.releaseDate),
                                        MovieInfoContainer(
                                            title: "RT Score",
                                            value: _movie.rtScore),
                                        // Text(_movie.releaseDate),
                                        // Text(_movie.rtScore)
                                      ],
                                    ),
                                    // kSizedBoxH5,
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MovieInfoContainer(
                                            title: "Producer",
                                            value: _movie.producer,
                                          ),
                                          MovieInfoContainer(
                                              title: "Director",
                                              value: _movie.director),
                                        ]),
                                  ]),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider();
                          },
                        )
            ],
          ),
        ),
      ),
    );
  }
}

class MovieInfoContainer extends StatelessWidget {
  final String title;
  final String value;

  const MovieInfoContainer({Key key, this.title, this.value}) : super(key: key);
  // const MovieInfoContainer({
  //   Key key,
  //   @required MovieModel movie,
  // })  : _movie = movie,
  //       super(key: key);

  // final MovieModel _movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title + ": ",
            style: TextStyle(fontSize: 12, color: Colors.black54)),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
