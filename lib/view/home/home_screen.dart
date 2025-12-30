import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_task/core/theme/app_colors.dart';
import 'package:movie_app_task/view/home/widgets/circle_movie_container.dart';
import 'package:movie_app_task/view/home/widgets/genre_section.dart';
import 'package:movie_app_task/viewmodel/movie_view_model.dart';
import 'package:movie_app_task/domain/model/genre_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieViewModel viewModel = MovieViewModel();
  final ScrollController _scrollController = ScrollController();

  final Map<int, GlobalKey> _sectionKeys = {};

  int activeGenreIndex = 0;

  @override
  void initState() {
    super.initState();
    viewModel.fetchMovies();

    for (int i = 0; i < GenreModel.mockGenres.length; i++) {
      _sectionKeys[i] = GlobalKey();
    }

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    for (int i = 0; i < GenreModel.mockGenres.length; i++) {
      final keyContext = _sectionKeys[i]!.currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox;
        final offset = box.localToGlobal(Offset.zero).dy;

        if (offset < 100 && offset > -100) {
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
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Observer(
          builder: (_) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                _buildHeader(),
                _buildGenreChips(),
                _buildGenreSections(),
              ],
            );
          },
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------

  SliverToBoxAdapter _buildHeader() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 20.w),
            child: Column(
              spacing: 20.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "For You ⭐",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 80.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.movies.take(10).length,
                    separatorBuilder: (_, __) => 20.horizontalSpace,
                    itemBuilder: (_, index) {
                      final movie = viewModel.movies[index];
                      return CircleMovieContainer(movie: movie);
                    },
                  ),
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Divider(height: 1.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              "Movies 🎬",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
          ),
          16.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
            child: _SearchBar(),
          ),
          12.verticalSpace,
        ],
      ),
    );
  }

  // ---------------- GENRE CHIPS ----------------

  SliverPersistentHeader _buildGenreChips() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _GenreHeaderDelegate(
        minHeight: 32.h,
        maxHeight: 32.h,
        child: Container(
          padding: EdgeInsets.only(left: 20.w),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: GenreModel.mockGenres.length,
            separatorBuilder: (_, __) => 12.horizontalSpace,
            itemBuilder: (_, index) {
              final genre = GenreModel.mockGenres[index];
              final isActive = index == activeGenreIndex;

              return GestureDetector(
                onTap: () => _scrollToGenre(index),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 6.5.h,
                  ),
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.redLight : AppColors.gray,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    genre.name,
                    style: TextStyle(
                      color: isActive ? AppColors.white : AppColors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // ---------------- SECTIONS ----------------

  SliverList _buildGenreSections() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: GenreModel.mockGenres.length,
        (context, index) {
          final genre = GenreModel.mockGenres[index];
          final movies = viewModel.movies.take(9).toList();

          return Padding(
            padding: EdgeInsets.only(top: 24.h, left: 16.w),
            child: GenreSection(
              key: _sectionKeys[index],
              title: genre.name,
              movies: movies,
            ),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          6.horizontalSpace,
          Expanded(
            child: Text("Search", style: TextStyle(color: Colors.grey)),
          ),
          Icon(Icons.mic, color: Colors.grey),
        ],
      ),
    );
  }
}

class _GenreHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _GenreHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
