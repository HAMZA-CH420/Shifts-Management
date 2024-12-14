import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreatedShifts extends StatelessWidget {
  const CreatedShifts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset("assets/images/Shift.svg")),
    );
  }
}
