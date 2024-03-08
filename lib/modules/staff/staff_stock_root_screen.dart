import 'package:flutter/material.dart';
import 'package:medicine_research/modules/staff/add_medicine_stock_screen.dart';
import 'package:medicine_research/modules/staff/staff_stock_manage_medicine_screen.dart';
import 'package:medicine_research/utils/constants.dart';
import 'package:medicine_research/widgets/custom_button.dart';


// ignore: must_be_immutable
class AddMedicineStockRootScreen extends StatelessWidget {
  AddMedicineStockRootScreen({super.key});

  final _addMedicineFormKey = GlobalKey<FormState>();

  Map<String, dynamic> _medicineStock = {};

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    const sizedBox = const SizedBox(
      height: 20,
    );
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: CustomButton(
          text: 'Add Stock',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddMedicineStockScreen(),
              ),
            );
          },
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: KButtonColor,
        title: const Text(
          'Stock',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: StaffStockManageMedicineScreen(

      )
    
    );
  }
  
}
