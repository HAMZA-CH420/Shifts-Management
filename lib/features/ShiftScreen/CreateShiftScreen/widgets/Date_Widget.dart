import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/provider/Shift_Provider.dart';

class DateWidget extends StatelessWidget {
  DateWidget({super.key});
  final TextEditingController _dateController = TextEditingController();
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
          controller: _dateController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.calendar_month_rounded,
              color: Palate.primaryColor,
            ),
            hintText: "Select Date",
            hintStyle: TextStyle(
                color: Palate.shiftTileBannerColor,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
          readOnly: true,
          onTap: () {
            _showDatePicker(context);
          },
        ),
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? _pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (_pickedDate != null) {
      _dateController.text = DateFormat("MMMd").format(_pickedDate);
      context.read<ShiftProvider>().addDate(_dateController.text);
    }
  }
}
