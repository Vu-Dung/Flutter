import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:movie/data/service/data/data_popular_list.dart';
import 'package:movie/screen/common/image.dart';
import 'package:movie/screen/common/size_config.dart';
import 'package:movie/screen/common/ui/list_view.dart';
import 'package:movie/screen/common/ui/vote_star.dart';
import 'package:movie/screen/movie/movile_controller.dart';

import '../router.dart';

class ScreenMovieList extends GetWidget<MovieListController> {
  @override
  final MovieListController controller = Get.put(MovieListController());

  ScreenMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Ink(
        color: Colors.white,
        child: GetBuilder<MovieListController>(
          builder: (_) => buildListView(_),
        ),
      ),
    );
  }

  Widget buildListView(MovieListController s) {
    var isLoadMore = s.isLoadingMore.value;
    int totalItem = s.movies.length;
    if (totalItem != 0) {
      return Column(
        children: [
          Expanded(
              child: RefreshIndicator(
            onRefresh: _refreshData,
            child: ListView.builder(
              itemCount: totalItem,
              itemBuilder: (BuildContext context, int index) {
                return buildMovieCardView(s, index);
              },
            ),
          )),
          if (isLoadMore)
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 40),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      );
    } else {
      return const Center(
        child: Text("Empty Data"),
      );
    }
  }

  Widget buildListView1(MovieListController s) {
    var isLoadMore = s.isLoadingMore.value;
    int totalItem = s.movies.length;
    if (totalItem != 0) {
      return Column(
        children: [
          Expanded(
              child: RefreshIndicator(
            onRefresh: _refreshData,
            child: IncrementallyLoadingListView(
              hasMore: () => s.hasMore.value,
              itemCount: () => totalItem,
              loadMore: () async {
                // can shorten to "loadMore: _loadMoreItems" but this syntax is used to demonstrate that
                // functions with parameters can also be invoked if needed
                _loadMore();
              },
              onLoadMore: () {},
              onLoadMoreFinished: () {},
              separatorBuilder: (_, __) => Divider(),
              loadMoreOffsetFromBottom: 2,
              itemBuilder: (context, index) {
                if ((isLoadMore == true) && index == totalItem - 1) {
                  return Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 40),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      buildMovieCardView(s, index),
                    ],
                  );
                }
                // return ItemCard(item: item);
                return buildMovieCardView(s, index);
              },
            ),
          )),
          if (isLoadMore)
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 40),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      );
    } else {
      return const Center(
        child: Text("Empty Data"),
      );
    }
  }

  Widget buildMovieCardView(MovieListController s, int index) {
    var result = s.movies[index];
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 5.0),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radiuscardView),
        ),
        child: SizedBox(
          // width: 250,
          height: _heightCardView,
          child: Stack(
            children: [
              buildContainerPhotoBackground(result),
              buildContainer(result),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(Result result) {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Container(
        child: buildContentView(result),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(_radiuscardView)),
        ),
      ),
    );
  }

  Widget buildContentView(Result result) {
    return SizedBox(
      width: double.infinity,
      height: _heightTitle,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(9.0, 15.0, 9.0, 15.0),
            child: Text(
              "${result.title}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(9.0, 0.0, 9.0, 0.0),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: _buildRatePanel(
                          result.vote_average, result.vote_count),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            width: 1, color: Colors.greenAccent),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.airplay_sharp,
                            color: Colors.green,
                            size: 17.0,
                          ),
                          Text(
                            "  Detail  ",
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Get.toNamed(screenMovieDetail, arguments: result.id);
                        // Get.to(const ScreenMovieDetail(),
                        //     arguments: ["${result.id}"]);
                      },
                      // child: Text(' b '),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildRating(double? voteAverage) {
    var temp = voteAverage ?? 0;
    return Row(
      children: [
        StarRating(
          rating: temp / 2.0,
          color: Colors.orangeAccent,
        ),
        Text("$voteAverage/10"),
      ],
    );
  }

  _buildRatePanel(
    double? voteAverage,
    int? votecount,
  ) {
    var votecounttemp = votecount ?? 0;
    return Wrap(
      direction: Axis.horizontal,
      children: [
        _buildRating(voteAverage),
        Text("($votecounttemp voted)",
            style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w300))
      ],
    );
  }

  Text buildTextSubTitle(String data) {
    return Text(data,
        style: const TextStyle(
            fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w300));
  }

  Widget buildContainerPhotoBackground(Result result) {
    return buildPosterPhoto("${result.backdrop_path}");
  }

  CachedNetworkImage buildPosterPhoto(String imageName) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      imageUrl: imageUrlW500(imageName),
      imageBuilder: (context, imageProvider) => Container(
        width: double.maxFinite,
        height: _heightCardView,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(_radiuscardView),
            bottom: Radius.circular(_radiuscardView),
          ),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Future<void> _refreshData() {
    return controller.loadMovies();
  }

  void _loadMore() {
    controller.loadMore();
  }
}

const _heightCardView = 250.0;
const _heightButton = 30.0;
const _heightTitle = 100.0;
const _radiuscardView = 13.0;
const _paddingCardView = 16.0;
