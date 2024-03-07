import 'package:flutter/material.dart';
import 'package:medicine_research/utils/constants.dart';

class StaffManageMedicineScreen extends StatelessWidget {
  const StaffManageMedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: KButtonColor,
        title: Text('Manage medicine'),

      ),
    );
  }
}