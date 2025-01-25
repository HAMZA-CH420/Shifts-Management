import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/ShiftScreen/ShiftDetail/Shift_Detail.dart';
import 'package:shifts_management/features/ShiftScreen/widgets/ShiftWidget/Custom_Shift_Widget.dart';

class MyShifts extends StatefulWidget {
  const MyShifts({super.key});

  @override
  State<MyShifts> createState() => _MyShiftsState();
}

class _MyShiftsState extends State<MyShifts> {
  Future<void> _refreshData() async {
    // Simulate fetching new data from an API
    await Future.delayed(const Duration(seconds: 1));

    // Update the state with new data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: RefreshIndicator(
        notificationPredicate: (notification) => true,
        color: Palate.primaryColor,
        onRefresh: _refreshData,
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection("CreatedShifts").get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Palate.primaryColor,
                ),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text("No Shifts Available"),
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
                                category: snapshot.data!.docs[index]
                                    ["category"],
                                location: snapshot.data!.docs[index]
                                    ["location"],
                                date: snapshot.data!.docs[index]["date"],
                                isOngoing: snapshot.data!.docs[index]
                                        ["status"] ==
                                    "Ongoing",
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
      ),
    );
  }
}
