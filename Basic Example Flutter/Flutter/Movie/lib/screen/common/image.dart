import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

String imageUrlW300(String? imageName) {
  return imageURL(imageName, "w300");
}

String imageUrlW500(String? imageName) {
  return imageURL(imageName, "w500");
}

String imageURL(String? imageName, size) {
  var data = "https://image.tmdb.org/t/p/$size/$imageName";
  print(data);
  return data;
}

CachedNetworkImage buildNetworkImage(
    String urlImage, ImageWidgetBuilder imageWidgetBuilder) {
  return CachedNetworkImage(
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
      imageUrl: urlImage,
      imageBuilder: imageWidgetBuilder);
}
