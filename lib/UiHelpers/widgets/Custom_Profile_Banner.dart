import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class CustomProfileBanner extends StatelessWidget {
  CustomProfileBanner(
      {super.key,
      required this.icon,
      required this.bannerTitle,
      required this.onTap});
  final IconData icon;
  final String bannerTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        width: 390,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Icon(
                size: 22,
                icon,
                color: Palate.primaryColor,
              ),
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: Palate.navBarColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: SizedBox(
                width: 133,
                child: Text(
                  bannerTitle,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              width: 114,
            ),
            IconButton(
                onPressed: onTap,
                icon: Icon(
                  size: 20,
                  Icons.arrow_forward_ios_sharp,
                  color: Palate.primaryColor,
                ))
          ],
        ),
      ),
    );
  }
}
