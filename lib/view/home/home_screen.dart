import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';
import 'package:movie_app_task/domain/model/genre_model.dart';
import 'package:movie_app_task/view/home/widgets/circle_movie_container.dart';
import 'package:movie_app_task/view/home/widgets/genre_chip.dart';
import 'package:movie_app_task/view/home/widgets/genre_section.dart';
import 'package:movie_app_task/viewmodel/movie_view_model.dart';

class HomeScreen extends StatefulWidget {
  final MovieViewModel viewModel;
  const HomeScreen({super.key, required this.viewModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final Map<int, GlobalKey> _sectionKeys = {};

  int activeGenreIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await widget.viewModel.fetchMovies();
      await widget.viewModel.fetchMoviesForSelectedGenres();

      for (int i = 0; i < widget.viewModel.genres.length; i++) {
        _sectionKeys[i] = GlobalKey();
      }
      setState(() {});
    });

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final genres = widget.viewModel.genres;

    for (int i = 0; i < genres.length; i++) {
      final keyContext = _sectionKeys[i]?.currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox;
        final offset = box.localToGlobal(Offset.zero).dy;

        if (offset < 250 && offset > -250) {
          if (activeGenreIndex != i) {
            setState(() => activeGenreIndex = i);
          }
          break;
        }
      }
    }
  }

  void _scrollToGenre(int index) {
    final context = _sectionKeys[index]!.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Observer(
          builder: (_) {
            if (widget.viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                _buildHeader(),
                Divider(height: 1.h, color: Colors.grey),
                16.verticalSpace,
                _buildMoviesSection(),
                12.verticalSpace,
                _buildGenreChips(widget.viewModel.genres),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: widget.viewModel.genres.length,
                    itemBuilder: (_, index) {
                      final genre = widget.viewModel.genres.elementAt(index);
                      final movies = widget.viewModel.movies;

                      return Padding(
                        padding: EdgeInsetsGeometry.only(top: 24.h, left: 16.w),
                        child: GenreSection(
                          key: _sectionKeys[index],
                          title: genre.name,
                          movies: movies,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.only(top: 26.h, left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "For You ⭐",
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          20.verticalSpace,
          SizedBox(
            height: 80.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.viewModel.recommendedMovies.length,
              separatorBuilder: (_, __) => 20.horizontalSpace,
              itemBuilder: (_, index) {
                final movie = widget.viewModel.recommendedMovies[index];
                return CircleMovieContainer(movie: movie);
              },
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }

  // ---------------- Movies - Search Section ----------------

  Widget _buildMoviesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            "Movies 🎬",
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
        ),
        16.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: _SearchBar(),
        ),
      ],
    );
  }

  // ---------------- GENRE CHIPS ----------------

  Widget _buildGenreChips(List<GenreModel> genres) {
    return Container(
      height: 32.h,
      padding: EdgeInsets.only(left: 20.w),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        separatorBuilder: (_, __) => 12.horizontalSpace,
        itemBuilder: (_, index) {
          final genre = genres[index];
          final isActive = index == activeGenreIndex;

          return GenreChip(
            label: genre.name,
            isActive: isActive,
            onTap: () => _scrollToGenre(index),
          );
        },
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,

      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.grayDark),
          6.horizontalSpace,
          Expanded(
            child: Text("Search", style: TextStyle(color: AppColors.grayDark)),
          ),
          Icon(Icons.mic, color: AppColors.grayDark),
        ],
      ),
    );
  }
}
