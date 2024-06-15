import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkCachedImage extends StatelessWidget {
  const NetworkCachedImage(
      {super.key, required this.url, this.height, this.weight, this.fit});

  final String url;
  final double? height;
  final double? weight;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(imageUrl: url);
  }
}
