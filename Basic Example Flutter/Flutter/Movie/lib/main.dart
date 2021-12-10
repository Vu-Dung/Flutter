import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:movie/screen/common/ui.dart';
import 'package:movie/screen/detail/movie_detail_controller.dart';
import 'package:movie/screen/detail/screen_movie_detail.dart';
import 'package:movie/screen/login/screen_login.dart';
import 'package:movie/screen/movie/screen_movie_list.dart';
import 'package:movie/screen/router.dart';

void main() {
  runApp(GetMaterialApp(
    theme: themeData,
    initialRoute: '/home',
    getPages: [
      GetPage(
        name: screenhome,
        page: () => ScreenMovieList(),
        binding: MovieDetailBinding(),
      ),
      GetPage(
          name: screenMovieDetail,
          page: () => ScreenMovieDetail(),
          binding: MovieDetailBinding(),
          transition: Transition.fade),
      GetPage(
          name: '/login',
          page: () => LoginPage(),
          binding: LoginBinding(),
          transition: Transition.fade),
    ],
  ));
}
