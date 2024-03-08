import 'package:flutter/material.dart';
import 'package:medicine_research/utils/constants.dart';
import 'package:medicine_research/widgets/custom_button.dart';
import 'package:medicine_research/widgets/custom_text_form_field.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class EditMedicineStockScreen extends StatelessWidget {
  EditMedicineStockScreen({super.key, required this.stock});


  final String  stock; 

  final _editMedicineFormKey = GlobalKey<FormState>();

  Map<String, dynamic> _medicineStock = {};

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    const sizedBox = const SizedBox(
                  height: 20,
                );
    return Scaffold(
      bottomSheet:  Container(

                  color: Colors.white,
        
                  width: MediaQuery.of(context).size.width,
                  child: CustomButton(
                    text: 'Update',
                    onPressed: () {
                      _UpdateMedicineStock(context);
                    },
                  ),
                ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: KButtonColor,
        title: const Text(
          'Update Stock',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _editMedicineFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBox,
                const Text(
                  'Medicine name',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                  hintText: 'Enter name',
                  borderColor: Colors.grey.shade300,
                  initialValue: stock,
                  validator: (value) {
                    return value!.isEmpty ? 'Enter the name' : null;
                  },
                  onSaved: (value) {
                    _medicineStock['name'] = value;
                  },
                ),
                sizedBox,
                const Text(
                  'Quantity',
                  style: TextStyle(
                      color: Colors.black,

                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                  hintText: 'Enter quantitiy',
                  borderColor: Colors.grey.shade300,
                  initialValue: stock,
                  validator: (value) {
                    return value!.isEmpty ? 'Enter the quantity' : null;
                  },
                  onSaved: (value) {
                    _medicineStock['qty'] = value;
                  },
                ),
                sizedBox,
                const Text(
                  'Unit',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                  hintText: 'Enter unit',
                  borderColor: Colors.grey.shade300,
                  initialValue: stock,
                  validator: (value) {
                    return value!.isEmpty ? 'Enter the unit' : null;
                  },
                  onSaved: (value) {
                    _medicineStock['unit'] = value;
                  },
                ),
                sizedBox,
                const Text(
                  'Medicine price',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                  hintText: 'Enter price',
                  borderColor: Colors.grey.shade300,
                  initialValue: stock,
                  validator: (value) {
                    return value!.isEmpty ? 'Enter the price' : null;
                  },
                  onSaved: (value) {
                    _medicineStock['price'] = value;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }

  _UpdateMedicineStock(BuildContext context) {
    bool validate = _editMedicineFormKey.currentState?.validate() ?? false;

    if (validate) {
      _editMedicineFormKey.currentState!.save();

      _editMedicineFormKey.currentState!.reset();

      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Transaction Completed Successfully!',
      );
    }
  }
}
