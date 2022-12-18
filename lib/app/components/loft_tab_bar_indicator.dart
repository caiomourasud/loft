import 'package:flutter/widgets.dart';

class LoftTabBarIndicator extends Decoration {
  const LoftTabBarIndicator({
    required this.indicatorHeight,
    required this.indicatorColor,
  });

  final double indicatorHeight;
  final Color indicatorColor;

  @override
  LoftTabBarPainter createBoxPainter([VoidCallback? onChanged]) {
    return LoftTabBarPainter(this, onChanged);
  }
}

class LoftTabBarPainter extends BoxPainter {
  final LoftTabBarIndicator decoration;

  LoftTabBarPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    Rect rect;
    rect = Offset(
          offset.dx,
          (configuration.size?.height ?? decoration.indicatorHeight) -
              decoration.indicatorHeight,
        ) &
        Size((configuration.size?.width ?? decoration.indicatorHeight),
            decoration.indicatorHeight);

    final Paint paint = Paint()
      ..color = decoration.indicatorColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        rect,
        Radius.circular(decoration.indicatorHeight),
      ),
      paint,
    );
  }
}
