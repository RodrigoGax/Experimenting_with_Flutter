import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart' show required;
import 'dart:math' as math;

class Responsive {
  final double ancho, alto, diagonal;

  Responsive(
      {@required this.ancho, @required this.alto, @required this.diagonal});

  factory Responsive.of(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final size = data.size;
    //Hallar la diagonal inch con Pitágoras
    final inch = math.sqrt(math.pow(size.width, 2) + math.pow(size.height, 2));
    return Responsive(ancho: size.width, alto: size.height, diagonal: inch);
  }

  double porcentajeAnchura(double porcentaje) {
    return this.ancho * porcentaje / 100;
  }

  double porcentajeAltura(double porcentaje) {
    return this.alto * porcentaje / 100;
  }

  double porcentajeDiagonal(double porcentaje) {
    return this.diagonal * porcentaje / 100;
  }
}
