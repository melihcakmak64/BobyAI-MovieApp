import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum ImageType { network, asset }

class ImageHelper extends StatelessWidget {
  final String imagePath;
  final ImageType type;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Color? color;
  final Widget? placeholder;
  final Widget? errorWidget;

  const ImageHelper.network(
    this.imagePath, {
    super.key,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.color,
    this.placeholder,
    this.errorWidget,
  }) : type = ImageType.network;

  const ImageHelper.asset(
    this.imagePath, {
    super.key,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.color,
  }) : type = ImageType.asset,
       placeholder = null,
       errorWidget = null;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ImageType.network:
        return CachedNetworkImage(
          imageUrl: imagePath,
          fit: fit,
          width: width,
          height: height,
          color: color,
          placeholder: (context, url) =>
              placeholder ?? const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) {
            return errorWidget ?? const Icon(Icons.error);
          },
        );
      case ImageType.asset:
        return Image.asset(
          imagePath,
          fit: fit,
          width: width,
          height: height,
          color: color,
        );
    }
  }
}
