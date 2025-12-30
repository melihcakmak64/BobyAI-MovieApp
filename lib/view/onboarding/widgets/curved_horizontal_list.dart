import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app_task/core/widgets/movie_poster_container.dart';
import 'package:movie_app_task/domain/model/movie_model.dart';
import 'package:movie_app_task/viewmodel/movie_view_model.dart';

class CurvedHorizontalList extends StatefulWidget {
  final List<MovieModel> movies;
  final MovieViewModel viewModel;

  const CurvedHorizontalList({
    super.key,
    required this.movies,
    required this.viewModel,
  });

  @override
  State<CurvedHorizontalList> createState() => _CurvedHorizontalListState();
}

class _CurvedHorizontalListState extends State<CurvedHorizontalList> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(viewportFraction: 0.6);

    controller.addListener(() {
      if (controller.position.pixels >
          controller.position.maxScrollExtent - 200) {
        widget.viewModel.fetchMoreMovies();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: widget.movies.length,
      physics: const BouncingScrollPhysics(),
      pageSnapping: false,
      itemBuilder: (context, index) {
        final movie = widget.movies[index];

        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            double value = 0.0;
            if (controller.position.haveDimensions) {
              value = index - controller.page!;
              value = (value * 0.35).clamp(-1.0, 1.0);
            }

            return Center(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateY(value)
                  ..translate(0.0, 0.0, value.abs() * -80),
                child: child,
              ),
            );
          },
          child: Observer(
            builder: (_) {
              final isSelected = widget.viewModel.selectedMovies.contains(
                movie,
              );

              return MoviePosterContainer(
                imagePath: movie.posterPath,
                isSelected: isSelected,
                onTap: () => widget.viewModel.toggleMovie(movie),
              );
            },
          ),
        );
      },
    );
  }
}
