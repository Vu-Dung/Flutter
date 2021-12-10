import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:movie/data/service/data/data_cast.dart';
import 'package:movie/data/service/data/data_movie_detail.dart';
import 'package:movie/screen/common/caculate.dart';
import 'package:movie/screen/common/image.dart';
import 'package:movie/screen/common/logger.dart';
import 'package:movie/screen/common/size_config.dart';
import 'package:movie/screen/common/ui/description_text.dart';
import 'package:movie/screen/common/ui/vote_star.dart';
import 'package:intl/intl.dart';

import 'movie_detail_controller.dart';

class ScreenMovieDetail extends GetView<MovieDetailController> {
  final PageController _pagecontroller = PageController(initialPage: 0);
  final _itemperpage = 6;
  var _idMovie = Get.arguments;

  ScreenMovieDetail({Key? key}) : super(key: key);
  final MovieDetailController _controller =
      Get.find(tag: "MovieDetailController");

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _idMovie = Get.arguments;
    logger.i("#build() idMovie: $_idMovie");
    _refreshData();
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              buildPhotoPoster(),
              Obx(() => moviInforrightColumn(_controller.movie.value)),
            ]),
            const SizedBox(
              height: 9,
            ),
            Obx(
              () => ExpandableText(
                  text: _controller.movie.value.overview ?? "",
                  trimLines: 3,
                  textStyle: textStyleSubTitle),
            ),
            const SizedBox(
              height: 9,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Cast",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            Obx(() => buildCredit(_controller.credit.value)),
          ],
        ),
      ),
    );
  }

  buildCredit(CreditResult? creditResult) {
    if (creditResult == null) {
      return const Center(
        child: Text("Empty Data"),
      );
    }
    if (creditResult.cast == null) {
      return const Center(
        child: Text("Empty Data"),
      );
    }
    if (creditResult.cast == null) {
      return const Center(
        child: Text("Empty Data"),
      );
    }
    if (creditResult.cast!.isEmpty) {
      return const Center(
        child: Text("Empty Data"),
      );
    }
    var casts = [];
    casts.addAll(creditResult.cast!);
    casts.unique((item) => (item as Cast).id);
    int remainItem = casts.length % _itemperpage;
    int totalPage = casts.length ~/ _itemperpage;
    if (remainItem > 0) {
      totalPage = totalPage + 1;
    }
    return Expanded(
        child: PageView.builder(
      controller: _pagecontroller,
      itemCount: totalPage,
      itemBuilder: (BuildContext context, int index) {
        List<Cast> dataPage;
        int tempIndex = index * _itemperpage;
        if ((tempIndex + _itemperpage) < casts.length) {
          dataPage =
              casts.sublist(tempIndex, tempIndex + _itemperpage).cast<Cast>();
        } else {
          dataPage = casts.sublist(tempIndex, casts.length).cast<Cast>();
        }
        logger.i("index $index");
        return itemCredit(dataPage, index);
      },
    ));
  }

  Widget itemCredit(List<Cast> casts, int index) {
    var width = SizeConfig.screenWidth / 3 - 30;
    var height = width * 1.3;
    return Container(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: width / height,
          ),
          itemCount: casts.length,
          itemBuilder: (BuildContext context, int index) {
            var cast = casts[index];
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Card(
                color: Colors.white,
                child: Stack(
                  children: [
                    buildPhotoAvatar(cast),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        child: SizedBox(
                          width: double.infinity,
                          height: 35.0,
                          child: Center(
                              child: Text(
                            "${cast.name}",
                            textAlign: TextAlign.center,
                          )),
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(2.0)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  buildPhotoAvatar(Cast? cast) {
    var width = SizeConfig.screenWidth / 2.5;
    var height = width * 4 / 3;
    if (cast != null &&
        cast.profile_path != null &&
        cast.profile_path!.isNotEmpty) {
      return SizedBox(
          width: width,
          height: height,
          child: Center(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              imageUrl: imageUrlW300(cast.profile_path),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(7.0),
                    bottom: Radius.circular(7.0),
                  ),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
            ),
          ));
    } else {
      return SizedBox(
        width: width,
        height: height,
        child: const Center(
          child: Text(
            "No Avatar",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  buildTitle(Cast cast) {
    return Text("${cast.name}");
  }

  Widget moviInforrightColumn(MovieDetail movieDetail) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(9, 5, 9, 5),
          child: Text(movieDetail.title ?? "", style: textStyleTitle),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(9, 5, 9, 5),
          child: buildGenres(movieDetail.genres),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(9, 5, 9, 5),
          child: buildRating(movieDetail.vote_average),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(9, 5, 9, 5),
          child: buildLanguage(movieDetail.original_language),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(9, 5, 9, 5),
          child:
              buildReleaseDate(movieDetail.release_date, movieDetail.runtime),
        ),
      ],
    ));
  }

  buildReleaseDate(String? rDate, int? rTime) {
    String? releaseDate = "2021-09-10";
    int? runtime = 0;
    if (rDate != null) {
      releaseDate = rDate;
      runtime = rTime;
      runtime ??= 100;
    }
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(releaseDate);

    var outputFormat = DateFormat.yMMMMd('en_US');
    var outputDate = outputFormat.format(inputDate);
    int hour = runtime ~/ 60;
    var minus = runtime % 60.toInt();
    return Text("$outputDate ${hour}h ${minus}m");
  }

  buildLanguage(String? langu) {
    var text = "en";
    if (langu != null) {
      if ("en" == langu) {
        text = "English";
      } else {
        if ("jp" == langu) {
          text = "Japanese";
        }
      }
    }
    return Text("Language: $text");
  }

  buildRating(double? voteAverage) {
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

  Widget buildGenres(List<Genre>? genders) {
    logger.i(" genders $genders");
    if (genders != null && genders.isNotEmpty) {
      List<Widget> items = <Widget>[];
      for (var gen in genders) {
        items.add(Text("${gen.name}"));
        items.add(Container(
          width: 1.0,
          height: 12.0,
          color: colorText,
        ));
      }
      items.removeLast();
      return Wrap(
        spacing: 8.0, // gap between adjacent chips
        runSpacing: 4.0, // gap
        children: items,
      );
    } else {
      return const Text("");
    }
  }

  Widget buildPhotoPoster() {
    var width = SizeConfig.screenWidth / 2.5;
    var height = (width) * 4 / 3;
    return SizedBox(
      width: width,
      height: height,
      child: Obx(() => posterMovie(_controller.movie.value.poster_path)),
    );
  }

  Widget posterMovie(String? imageName) {
    if (imageName == null || imageName.isEmpty) {
      return const Center(
        child: Text("No Poster"),
      );
    } else {
      return CachedNetworkImage(
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        imageUrl: imageUrlW300(imageName),
        imageBuilder: (context, imageProvider) => Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
      );
    }
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        'Movie Detail',
      ),
    );
  }

  _refreshData() {
    _controller.loadMovies(_idMovie);
    _controller.loadCredit(_idMovie);
  }
}

const Color colorText = Colors.black87;
const TextStyle textStyleTitle =
    TextStyle(fontSize: 24, fontWeight: FontWeight.w300, color: colorText);
const TextStyle textStyleSubTitle =
    TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: colorText);
