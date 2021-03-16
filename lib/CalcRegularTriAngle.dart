import 'dart:math';
import 'package:angles/angles.dart';

import './Calculator.dart';

class RegTriAngle {
  final Calculator calculator = Calculator((String foo) {});

  Map<String, dynamic> sss({
    required double a,
    required double b,
    required double c,
  }) {
    Map<String, dynamic> triAngle = {
      'a': a,
      'b': b,
      'c': c,
      'alpha': 0,
      'betha': 0,
      'gamma': 0,
    };
    // GET ALPHA

    double cosA = (a * a - b * b - c * c) / (-2 * b * c);

    double cosB = (b * b - c * c - a * a) / (-2 * c * a);

    double cosG = (c * c - a * a - b * b) / (-2 * a * b);

    var ca = Angle.acos(cosA);
    var cb = Angle.acos(cosB);
    var cg = Angle.acos(cosG);

    triAngle['alpha'] = ca.degrees;
    triAngle['betha'] = cb.degrees;
    triAngle['gamma'] = cg.degrees;

    if ((ca.degrees + cb.degrees + cg.degrees).round() == 180) {
      print('correct');
    } else {
      print('ERROR! SSS is not correct!');
      print((ca.degrees + cb.degrees + cg.degrees).round());
    }

    return triAngle;
  }

  Map<String, dynamic> sws({
    double? a,
    double? b,
    double? c,
    double? alpha,
    double? betha,
    double? gamma,
  }) {
    // CHECK IF ALL VARIABLES ARE GIVEN
    List<bool> allVariablesGiven = [];

    if (a != null) {
      allVariablesGiven.add(true);
    }
    if (b != null) {
      allVariablesGiven.add(true);
    }
    if (c != null) {
      allVariablesGiven.add(true);
    }
    if (alpha != null) {
      allVariablesGiven.add(true);
    }
    if (betha != null) {
      allVariablesGiven.add(true);
    }
    if (gamma != null) {
      allVariablesGiven.add(true);
    }
    // CHECK IF ALL VARIABLES ARE RIGHT
    if (gamma != null && betha != null ||
        gamma != null && alpha != null ||
        betha != null && alpha != null) {
      print('FALSE INPUT');
      return {};
    }
    if (allVariablesGiven.length != 3) {
      print('FALSE INPUT');
      return {};
    }

    /**
     * a = Sqr(b * b + c * c - 2 * b * c * cos(α))
     * b = Sqr(a * a + c * c - 2 * a * c * cos(β))
     * c = Sqr(a * a + b * b - 2 * a * b * cos(γ))
    **/

    if (a == null && b != null && c != null && alpha != null) {
      Angle cosAlpha = Angle.fromDegrees(alpha);
      a = sqrt((b * b) + (c * c) - (2 * b * c * cosAlpha.cos));
    }
    if (b == null && a != null && c != null && betha != null) {
      Angle cosBetha = Angle.fromDegrees(betha);
      b = sqrt((a * a) + (c * c) - (2 * a * c * cosBetha.cos));
    }
    if (c == null && a != null && b != null && gamma != null) {
      Angle cosGamma = Angle.fromDegrees(gamma);
      c = sqrt(a * a + b * b - 2 * a * b * cosGamma.cos);
    }

    if (a != null && b != null && c != null) {
      return this.sss(
        a: a,
        b: b,
        c: c,
      );
    } else {
      return {};
    }
  }

  wsw() {}
  sww() {}
  ssw() {}
}
