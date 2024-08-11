import 'package:hooks_riverpod/hooks_riverpod.dart';

class CompassRotationNotifier extends Notifier<double> {
  @override
  double build() => 0;

  void setRotation(double value) {
    double newValue = state + value;
    if (newValue > 180) {
      newValue -= 360;
    } else if (newValue <= -180) {
      newValue += 360;
    }
    state = (newValue * 10).roundToDouble() / 10;
  }
}

final compassRotationPdr = NotifierProvider<CompassRotationNotifier, double>(
    CompassRotationNotifier.new);
