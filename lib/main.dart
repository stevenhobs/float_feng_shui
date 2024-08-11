import 'package:float_feng_shui/main_ui.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    title: "悬浮风水罗盘",
    alwaysOnTop: true,
    size: Size(500, 500),
    minimumSize: Size(200, 200),
    center: true,
    backgroundColor: Colors.transparent,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setAspectRatio(1);
    await windowManager.setBrightness(Brightness.light);
    await windowManager.setAsFrameless();
  });

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => FluentApp(
        debugShowCheckedModeBanner: false,
        home: const MainUI(),
        theme: FluentThemeData(fontFamily: "Microsoft YaHei"),
        locale: const Locale("zh_CN"),
      );
}
