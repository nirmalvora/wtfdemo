import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  final String imageUrl;
  const HomeHeaderWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: CachedNetworkImage(imageUrl: imageUrl),
    );
  }
}
