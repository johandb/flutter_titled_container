import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class TitledContainer extends SingleChildRenderObjectWidget {
  const TitledContainer({
    Key? key,
    required Widget child,
    required this.titleColor,
    required this.title,
    required this.fontSize,
  }) : super(key: key, child: child);

  final Color titleColor;
  final String title;
  final double fontSize;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderTitledContainer(
      titleColor: titleColor,
      title: title,
      fontSize: fontSize,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderTitledContainer renderObject) {
    renderObject..titleColor = titleColor;
    renderObject..title = title;
    renderObject..fontSize = fontSize;
  }
}

class RenderTitledContainer extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  RenderTitledContainer({
    required Color titleColor,
    required String title,
    required double fontSize,
  })   : _titleColor = titleColor,
        _title = title,
        _fontSize = fontSize;

  Color get titleColor => _titleColor;
  Color _titleColor;
  set titleColor(Color value) {
    if (_titleColor == value) return;
    _titleColor = value;
    markNeedsPaint();
  }

  String get title => _title;
  String _title;
  set title(String value) {
    if (_title == value) return;
    _title = value;
    markNeedsPaint();
  }

  double get fontSize => _fontSize;
  double _fontSize;
  set fontSize(double value) {
    if (_fontSize == value) return;
    _fontSize = value;
    markNeedsPaint();
  }

  @override
  void performLayout() {
    if (child == null) {
      size = constraints.smallest;
    } else {
      child!.layout(constraints, parentUsesSize: true);
      size = constraints.constrain(Size(child!.size.width, child!.size.height));
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      context.paintChild(child!, offset);

      final canvas = context.canvas;
      canvas.save();
      canvas.translate(offset.dx, offset.dy);
      final textSpan = TextSpan(
        text: ' $title ',
        style: TextStyle(
          color: titleColor,
          fontSize: fontSize,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
        ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );
      final titleOffset = Offset(10, -fontSize / 2 - 2);
      textPainter.paint(canvas, titleOffset);

      canvas.restore();
    }
  }

  @protected
  bool get alwaysNeedsCompositing => true;
}
