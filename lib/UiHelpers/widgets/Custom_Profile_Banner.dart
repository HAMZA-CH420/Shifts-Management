import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';

class CustomProfileBanner extends StatelessWidget {
  const CustomProfileBanner(
      {super.key,
      required this.icon,
      required this.bannerTitle,
      required this.onTap});
  final IconData icon;
  final String bannerTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 55,
        width: size.width,
        child: Row(
          spacing: 10,
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: Palate.navBarColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(
                size: 22,
                icon,
                color: Palate.primaryColor,
              ),
            ),
            SizedBox(
              width: size.width / 1.28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 115,
                    child: Text(
                      bannerTitle,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Icon(
                    size: 18,
                    Icons.arrow_forward_ios_sharp,
                    color: Palate.primaryColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
