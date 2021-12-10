import 'package:get/get.dart';
import 'package:movie/data/service/data/data_popular_list.dart';
import 'package:movie/screen/movie/repository/movie_repository.dart';

class MovieListController extends GetxController {
  var movies = List<Result>.empty().obs;
  var isLoadingMore = false.obs;
  var curentPage = 1;
  var totalPage = 0;
  var hasMore = true.obs;

  loadMovies() async {
    var data = await getPopular(curentPage);
    totalPage = data.total_pages ?? 0;
    if (data.results != null) {
      movies.addAll(data.results!);
      update();
    } else {
      movies.clear();
    }
  }

  loadMore() async {
    isLoadingMore(true);
    if (curentPage < totalPage) {
      curentPage++;
      hasMore(true);
      var data = await getPopular(curentPage);
      if (data.results != null) {
        movies.addAll(data.results!);
        update();
        isLoadingMore(false);
      } else {
        movies.clear();
      }
    } else {
      hasMore(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadMovies();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
