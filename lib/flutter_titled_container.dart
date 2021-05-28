import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

enum TextAlignTitledContainer { Left, Center, Right }

class TitledContainer extends SingleChildRenderObjectWidget {
  const TitledContainer({
    Key? key,
    required Widget child,
    titleColor,
    required this.title,
    textAlign,
    fontSize,
    backgroundColor,
  })  : fontSize = fontSize ?? 14.0,
        titleColor = titleColor ?? const Color.fromRGBO(0, 0, 0, 1.0),
        textAlign = textAlign ?? TextAlignTitledContainer.Left,
        backgroundColor = backgroundColor ?? const Color.fromRGBO(255, 255, 255, 1.0),
        super(key: key, child: child);

  final Color titleColor;
  final Color backgroundColor;
  final String title;
  final TextAlignTitledContainer textAlign;
  final double fontSize;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderTitledContainer(
      titleColor: titleColor,
      title: title,
      fontSize: fontSize,
      backgroundColor: backgroundColor,
      textAlign: textAlign,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderTitledContainer renderObject) {
    renderObject..titleColor = titleColor;
    renderObject..backgroundColor = backgroundColor;
    renderObject..title = title;
    renderObject..fontSize = fontSize;
    renderObject..textAlign = textAlign;
  }
}

class RenderTitledContainer extends RenderBox with RenderObjectWithChildMixin<RenderBox> {
  RenderTitledContainer({
    required Color titleColor,
    required String title,
    required double fontSize,
    required Color backgroundColor,
    required TextAlignTitledContainer textAlign,
  })   : _titleColor = titleColor,
        _title = title,
        _textAlign = textAlign,
        _backgroundColor = backgroundColor,
        _fontSize = fontSize;

  Color get titleColor => _titleColor;
  Color _titleColor;
  set titleColor(Color value) {
    if (_titleColor == value) return;
    _titleColor = value;
    markNeedsPaint();
  }

  Color get backgroundColor => _backgroundColor;
  Color _backgroundColor;
  set backgroundColor(Color value) {
    if (_backgroundColor == value) return;
    _backgroundColor = value;
    markNeedsPaint();
  }

  String get title => _title;
  String _title;
  set title(String value) {
    if (_title == value) return;
    _title = value;
    markNeedsPaint();
  }

  TextAlignTitledContainer get textAlign => _textAlign;
  TextAlignTitledContainer _textAlign;
  set textAlign(TextAlignTitledContainer value) {
    if (_textAlign == value) return;
    _textAlign = value;
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
          height: 1.0,
          backgroundColor: backgroundColor,
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

      final TextPainter txtPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
      txtPainter.layout(minWidth: 0, maxWidth: double.infinity);
      double xPos = 10.0;
      switch (textAlign) {
        case TextAlignTitledContainer.Center:
          xPos = (size.width - txtPainter.size.width) / 2.0;
          break;
        case TextAlignTitledContainer.Right:
          xPos = (size.width - txtPainter.size.width - 10);
          break;
        default:
          xPos = 10.0;
      }
      final titleOffset = Offset(xPos, -fontSize / 2);
      textPainter.paint(canvas, titleOffset);

      canvas.restore();
    }
  }

  @protected
  bool get alwaysNeedsCompositing => true;
}
