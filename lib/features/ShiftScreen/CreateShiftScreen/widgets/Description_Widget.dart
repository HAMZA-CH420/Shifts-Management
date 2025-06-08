import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/provider/Shift_Provider.dart';

class DescriptionWidget extends StatefulWidget {
  DescriptionWidget({super.key});

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 200,
        width: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "write Description(Optional)",
            hintStyle:
                TextStyle(color: Palate.shiftTileBannerColor, fontSize: 15),
          ),
          onTap: () {
            context
                .read<ShiftProvider>()
                .addDescription(controller.text.toString());
          },
        ),
      ),
    );
  }
}
