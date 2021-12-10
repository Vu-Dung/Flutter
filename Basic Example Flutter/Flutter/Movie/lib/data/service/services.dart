import 'package:dio/dio.dart';
import 'package:movie/data/service/data/data_movie_detail.dart';
import 'package:movie/data/service/data/data_nowplaying_list.dart';
import 'package:retrofit/retrofit.dart';

import 'data/data_cast.dart';
import 'data/data_popular_list.dart';

part 'services.g.dart';

const String clientId = "d5b97a6fad46348136d87b78895a0c06";
const String lang = "en-US";

/// 1. add build_runner: any to dev_dependencies
/// 2. flutter pub run build_runner build
/// */
@RestApi(
    baseUrl: "https://api.themoviedb.org/3/movie/",
    parser: Parser.FlutterCompute)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/popular")
  Future<PopularList> getPopular(
      {@Query("language") String language = lang,
      @Query("page") int page = 1,
      @Query("api_key") String clientId = clientId});

  // api.themoviedb.org/3/movie/now_playing?api_key=d5b97a6fad46348136d87b78895a0c06&page={pageNumber}
  @GET("/now_playing")
  Future<NowPlaying> getNowPlaying(
      {@Query("language") String language = lang,
      @Query("page") int page = 1,
      @Query("api_key") String clientId = clientId});

  // api.themoviedb.org/3/movie/{movieId}?api_key=d5b97a6fad46348136d87b78895a0c06
  @GET("{movieId}")
  Future<MovieDetail> getMovie(
      {@Path("movieId") String? movieId,
      @Query("api_key") String clientId = clientId});
  // api.themoviedb.org/3/movie/{movieId}/credits?api_key=d5b97a6fad46348136d87b78895a0c06
  @GET("{movieId}/credits")
  Future<CreditResult> getCredits(
      {@Path("movieId") String? movieId,
      @Query("api_key") String clientId = clientId});
}
