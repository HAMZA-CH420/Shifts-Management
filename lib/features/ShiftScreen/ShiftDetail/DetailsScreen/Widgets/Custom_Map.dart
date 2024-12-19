import 'package:flutter/cupertino.dart';

class CustomMap extends StatelessWidget {
  const CustomMap({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      height: 100,
      child: Image.asset(
        "assets/images/Map.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
