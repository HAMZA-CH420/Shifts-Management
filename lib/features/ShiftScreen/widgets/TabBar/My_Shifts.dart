import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/Shift_Detail.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Custom_Shift_Widget.dart';

class MyShifts extends StatelessWidget {
  const MyShifts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: FutureBuilder(
        future: FirebaseFirestore.instance.collection("Shifts").get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: ShiftDetail(
                              status: snapshot.data!.docs[index]["status"]),
                          type: PageTransitionType.rightToLeft));
                },
                child: CustomShiftWidget(
                  category: snapshot.data!.docs[index]["category"],
                  status: snapshot.data!.docs[index]["status"],
                  location: snapshot.data!.docs[index]["location"],
                  endingTime: snapshot.data!.docs[index]["ending time"],
                  startingTime: snapshot.data!.docs[index]["starting time"],
                  duration: snapshot.data!.docs[index]["duration"],
                  date: snapshot.data!.docs[index]["date"],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
