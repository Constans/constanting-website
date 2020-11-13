import 'package:flutter/material.dart';
import 'dart:math' as Math;

class ConstantingLogo extends CustomPainter {

  List<Point> dominoPoints = <Point>[Point(0, 777.15), Point(481.85, 777.15), Point(481.85, 1000), Point(0, 1000)];
  List<Point> tetrominoTPoints = <Point>[Point(0, 0), Point(222.8, 0), Point(222.8, 259.05), Point(481.85, 259.05), Point(481.85, 481.85), Point(222.8, 481.85), Point(222.8, 740.9), Point(0, 740.9)];
  List<Point> tetrominoSPoints = <Point>[Point(259.05, 518.1), Point(740.9, 518.1), Point(740.9, 777.15), Point(1000, 777.15), Point(1000, 1000), Point(518.1, 1000), Point(518.1, 740.9), Point(259.05, 740.9)];

  double scale = 1.0;
  double offsetX = 0.0;
  double offsetY = 0.0;
  static final int referenceSize = 1000; 
  
  void  drawPathFromPoints(Canvas c, Paint paint, List<Point> points) {

    List<Point> transformedPoints = <Point>[];
    points.forEach((Point p) => transformedPoints.add(Point(offsetX + p.x*scale, offsetY + p.y*scale)) );

    Point startPoint = transformedPoints[0];

    Path path = Path();
    path.moveTo(startPoint.x, startPoint.y);
    for(int i=1; i<points.length; i++) {
      path.lineTo(transformedPoints[i].x, transformedPoints[i].y) ;
    }
    path.lineTo(startPoint.x, startPoint.y);

    c.drawPath(path, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {

    scale = Math.min(size.width, size.height)/referenceSize;
    if(size.width == size.height) {
      offsetX = 0;
      offsetY = 0;
    } else if(size.width > size.height) {
      offsetX = (size.width-size.height)/2;
    } else {
      offsetY = (size.height-size.width)/2;
    }

    Paint dominoPaint = Paint();
    dominoPaint
      ..color = Color.fromRGBO(203, 68, 56, 1)
      ..style = PaintingStyle.fill;

    Paint tetrominoTPaint = Paint();
    tetrominoTPaint
      ..color = Color.fromRGBO(99, 125, 188, 1)
      ..style = PaintingStyle.fill;

    Paint tetrominoSPaint = Paint();
    tetrominoSPaint
      ..color = Color.fromRGBO(233, 188, 50, 1)
      ..style = PaintingStyle.fill;

    drawPathFromPoints(canvas, dominoPaint, dominoPoints);
    drawPathFromPoints(canvas, tetrominoTPaint, tetrominoTPoints);
    drawPathFromPoints(canvas, tetrominoSPaint, tetrominoSPoints);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}

class Point  {
  double x = 0.0;
  double y = 0.0;
  
  Point(this.x, this.y);
}