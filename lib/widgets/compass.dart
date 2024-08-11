import 'dart:math';

import 'package:float_feng_shui/store/state.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Compass extends ConsumerWidget {
  const Compass({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rotateValue = ref.watch(compassRotationPdr);
    return Transform.rotate(
        angle: rotateValue * (pi) / 180,
        child: Image.asset("assets/img/compass_1.png"));
  }
}
