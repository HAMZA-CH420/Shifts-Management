import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/provider/Shift_Provider.dart';

class AddShiftTimeWidget extends StatelessWidget {
  AddShiftTimeWidget({super.key, this.isEndingTime = false});
  final bool isEndingTime;
  final TextEditingController _timeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: .5,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 7, left: 20, top: 3),
        height: 55,
        width: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: TextField(
          controller: _timeController,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: const Icon(
              Icons.watch_later,
              color: Palate.primaryColor,
            ),
            hintText: isEndingTime ? "Ending Time" : "Starting Time",
            hintStyle: const TextStyle(
                color: Palate.shiftTileBannerColor,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          readOnly: true,
          onTap: () {
            _showTimePicker(context);
          },
        ),
      ),
    );
  }

  Future<void> _showTimePicker(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      _timeController.text = pickedTime.format(context);
      if (isEndingTime) {
        context.read<ShiftProvider>().addEndTime(_timeController.text);
      } else {
        context.read<ShiftProvider>().addStartTime(_timeController.text);
      }
    }
  }
}
