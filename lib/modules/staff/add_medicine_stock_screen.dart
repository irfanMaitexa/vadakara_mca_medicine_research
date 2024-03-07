import 'package:flutter/material.dart';
import 'package:medicine_research/utils/constants.dart';

class AddMedicineStockScreen extends StatelessWidget {
  const AddMedicineStockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: KButtonColor,
        title: Text(
          'Add Stock',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Medicine name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16
              ),
            ),

          ],
        ),
      ),
    );
  }
}
