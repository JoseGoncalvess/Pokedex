import 'package:flutter/material.dart';

class CustomPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h - 100); //ponto 1
    path.quadraticBezierTo(w / 2, h, w, h - 100); //ponto 2
    path.lineTo(w, 0); //ponto 3
    //ambas formam o circulo
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw false;
  }
}
