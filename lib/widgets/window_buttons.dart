import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_svg/svg.dart';
import 'package:window_manager/window_manager.dart';

final windowBtn = SizedBox(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: () async {
          final windowSize = await windowManager.getSize();
          final newBorderLen = windowSize.width + 50;
          await windowManager.setSize(Size(newBorderLen, newBorderLen),
              animate: true);
        },
        child: SvgPicture.asset("assets/img/window_zoom_in.svg",
            width: 20, height: 20),
      ),
      const SizedBox(width: 4),
      GestureDetector(
        onTap: () async {
          final windowSize = await windowManager.getSize();
          final newBorderLen = windowSize.width - 50;
          // if (newBorderLen < 200) return;
          await windowManager.setSize(Size(newBorderLen, newBorderLen),
              animate: true);
        },
        child: SvgPicture.asset("assets/img/window_zoom_out.svg",
            width: 20, height: 20),
      ),
      const SizedBox(width: 6),
      GestureDetector(
        onTap: () => windowManager.minimize(),
        child: SvgPicture.asset("assets/img/window_min.svg",
            width: 24, height: 24),
      ),
      GestureDetector(
        onTap: () => windowManager.close(),
        child: SvgPicture.asset("assets/img/window_close.svg",
            width: 30, height: 30),
      ),
    ],
  ),
);
