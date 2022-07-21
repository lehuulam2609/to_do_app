
import 'package:to_do_app/widgets_components/conditional_widget.dart';
import 'package:flutter/material.dart';

class NetWorkImageWidget extends StatelessWidget {
  NetWorkImageWidget(
      {this.imageUrl,
      this.width,
      this.height,
      this.borderRadius,
      this.backgroundColor,
      this.radius = 0});

  final double width;
  final double height;
  final double radius;
  final BorderRadiusGeometry borderRadius;
  final String imageUrl;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ConditionalWidget(
      condition: imageUrl != null && imageUrl.isNotEmpty,
      widgetShowIfTrue: () => ClipRRect(

        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Container(
          width: width,
          height: height,
          child: Image.network(
            imageUrl,
            width: width,
            height: height,
            fit: BoxFit.cover,
            loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return _imageUrlError();
            },
            errorBuilder: (context, error, stackTrace) {
              return _imageUrlError();
            },
          ),
        ),
      ),
      widgetShowIfFalse: () => _imageUrlError(),
    );
  }

  Widget _imageUrlError() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius:
            borderRadius ?? BorderRadius.all(Radius.circular(radius ?? 0)),
        color: backgroundColor ?? Colors.black.withOpacity(0.3),
      ),
      child: Icon(Icons.image),
    );
  }
}
