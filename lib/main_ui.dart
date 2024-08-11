import 'package:float_feng_shui/widgets/compass.dart';
import 'package:float_feng_shui/widgets/compass_buttons.dart';
import 'package:float_feng_shui/widgets/window_buttons.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:window_manager/window_manager.dart';

class MainUI extends HookWidget {
  const MainUI({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final listener = MyWindowListener(context);
      windowManager.addListener(listener);
      windowManager.setPreventClose(true);
      return () {
        windowManager.removeListener(listener);
      };
    }, []);

    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(60, 255, 255, 255),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: const Color.fromARGB(60, 155, 155, 155), width: 1.0)),
      child: Stack(
        children: [
          const DragToMoveArea(child: Compass()),
          Positioned(right: 0, top: 0, child: windowBtn),
          const Positioned(bottom: 0, left: 0, child: CompassRotationMenu()),
        ],
      ),
    );
  }
}

class MyWindowListener with WindowListener {
  const MyWindowListener(this.context);
  final BuildContext context;

  @override
  void onWindowClose() async {
    var isPreventClose = await windowManager.isPreventClose();
    if (!context.mounted) return;
    if (isPreventClose) {
      final result = await showDialog<bool>(
        context: context,
        builder: (_) => ContentDialog(
          title: const Text('确认退出？'),
          actions: [
            Button(
                child: const Text("取消"),
                onPressed: () => Navigator.of(_).pop(false)),
            Button(
                child: const Text("退出"),
                onPressed: () => Navigator.of(_).pop(true)),
          ],
        ),
      );
      if (result == true) {
        windowManager.destroy();
      }
    }
  }

  @override
  void onWindowMaximize() {
    windowManager.unmaximize();
    return;
  }
}
