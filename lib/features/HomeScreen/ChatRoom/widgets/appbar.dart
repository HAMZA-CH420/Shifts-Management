import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert, color: Colors.black),
      )
    ],
    leadingWidth: 25,
    toolbarHeight: 65,
    title: Row(
      spacing: 10,
      children: [
        const Icon(
          Icons.account_circle,
          size: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "John Doe",
              style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            Text(
              "Active Yesterday at 10:32PM",
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
