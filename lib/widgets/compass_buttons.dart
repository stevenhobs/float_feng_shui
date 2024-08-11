import 'package:float_feng_shui/store/state.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:group_button/group_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _controlFontStyle =
    TextStyle(color: Color.fromARGB(150, 50, 49, 48), fontSize: 12);
const _bgColor = Color.fromARGB(150, 255, 255, 255);
const _btnOptions = GroupButtonOptions(
  buttonHeight: 20,
  buttonWidth: 30,
  borderRadius: BorderRadius.all(Radius.circular(6)),
  spacing: 4,
  runSpacing: 4,
  selectedColor: _bgColor,
  unselectedColor: _bgColor,
  selectedTextStyle: _controlFontStyle,
  unselectedTextStyle: _controlFontStyle,
);

class CompassRotationMenu extends StatelessWidget {
  const CompassRotationMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 78,
      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: Consumer(
        builder: (ctx, ref, child) {
          final rotationValue = ref.watch(compassRotationPdr);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "角 $rotationValue°",
                style: const TextStyle(
                    fontFamily: "KaiTi",
                    fontSize: 16,
                    color: Color.fromARGB(180, 50, 49, 48)),
              ),
              const SizedBox(height: 8),
              GroupButton(
                buttons: const ["-10", "-1", "-0.1", "+10", "+1", "+0.1"],
                options: _btnOptions,
                onSelected: (value, _, __) {
                  ref
                      .read(compassRotationPdr.notifier)
                      .setRotation(double.parse(value));
                },
              )
            ],
          );
        },
      ),
    );
  }
}
