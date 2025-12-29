import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app_task/core/helpers/image_helper.dart';
import 'package:movie_app_task/viewmodel/movie_view_model.dart';
import '../../core/constants/api_constants.dart';

class MovieView extends StatelessWidget {
  final MovieViewModel viewModel;

  const MovieView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Popular Movies")),
      body: Observer(
        builder: (_) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage != null) {
            return Center(child: Text(viewModel.errorMessage!));
          }

          return ListView.builder(
            itemCount: viewModel.movies.length,
            itemBuilder: (context, index) {
              final movie = viewModel.movies[index];

              return ListTile(
                leading: movie.posterPath != null
                    ? ImageHelper.network(
                        "${ApiConstants.imageBaseUrl}${movie.posterPath}",
                        width: 50,
                      )
                    : null,
                title: Text(movie.title),
                subtitle: Text("⭐ ${movie.rating}"),
              );
            },
          );
        },
      ),
    );
  }
}
