import 'dart:math';
import 'package:angles/angles.dart';

import './Calculator.dart';

class RegTriAngle {
  final Calculator calculator = Calculator((String foo) {});

  List<Map<String, dynamic>> sss({
    required double a,
    required double b,
    required double c,
  }) {
    List<Map<String, dynamic>> resultAngles = [
      {'alpha': 0},
      {'betha': 0},
      {'gamma': 0},
    ];

    // GET ALPHA

    double cosA = (a * a - b * b - c * c) / (-2 * b * c);

    double cosB = (b * b - c * c - a * a) / (-2 * c * a);

    double cosG = (c * c - a * a - b * b) / (-2 * a * b);

    var ca = Angle.acos(cosA);
    var cb = Angle.acos(cosB);
    var cg = Angle.acos(cosG);

    resultAngles[0]['alpha'] = ca.degrees;
    resultAngles[1]['betha'] = cb.degrees;
    resultAngles[2]['gamma'] = cg.degrees;

    if ((ca.degrees + cb.degrees + cg.degrees).round() == 180) {
      print('correct');
    } else {
      print('ERROR! SSS is not correct!');
      print((ca.degrees + cb.degrees + cg.degrees).round());
    }

    return resultAngles;
  }

  sws() {}
  wsw() {}
  sww() {}
  ssw() {}
}
