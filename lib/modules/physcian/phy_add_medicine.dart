import 'package:flutter/material.dart';
import 'package:medicine_research/modules/auth/login.dart';
import 'package:medicine_research/utils/constants.dart';
import 'package:medicine_research/widgets/custom_button.dart';
import 'package:medicine_research/widgets/custom_text_form_field.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class PhyAddMedicineScreen extends StatelessWidget {
  PhyAddMedicineScreen({super.key});

  final _addMedicineFormKey = GlobalKey<FormState>();

  Map<String, dynamic> _medicineStock = {};

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(
      height: 20,
    );
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: CustomButton(
          text: 'Add',
          onPressed: () {
            _addMedicine(context);
          },
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey),
        backgroundColor: KButtonColor,
        title: const Text(
          'Add Medicine',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        
      ),
      body: Form(
        key: _addMedicineFormKey,
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
                  validator: (value) {
                    return value!.isEmpty ? 'Enter the name' : null;
                  },
                  onSaved: (value) {
                    _medicineStock['name'] = value;
                  },
                ),
                sizedBox,
                const Text(
                  'Description',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                  hintText: 'Enter description',
                  borderColor: Colors.grey.shade300,
                  validator: (value) {
                    return value!.isEmpty ? 'Enter the quantity' : null;
                  },
                  onSaved: (value) {
                    _medicineStock['desc'] = value;
                  },
                ),
                sizedBox,
                const Text(
                  'purpose',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),

                CustomFormTextField(
                  hintText: 'Enter purpose',
                  borderColor: Colors.grey.shade300,
                  validator: (value) {
                    return value!.isEmpty ? 'Enter the purpose' : null;
                  },
                  onSaved: (value) {
                    _medicineStock['purpose'] = value;
                  },
                ),
                const Text(
                  'Dosage form',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),

                CustomFormTextField(
                  hintText: 'Enter Dosage form',
                  borderColor: Colors.grey.shade300,
                  validator: (value) {
                    return value!.isEmpty ? 'Enter the form' : null;
                  },
                  onSaved: (value) {
                    _medicineStock['form'] = value;
                  },
                ),
                SizedBox(height: 10,),
                 const Text(
                  'increadiance',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                  hintText: 'Enter increadiance',
                  borderColor: Colors.grey.shade300,
                  validator: (value) {
                    return value!.isEmpty ? 'Enter the increadiance' : null;
                  },
                  onSaved: (value) {
                    _medicineStock['increadiance'] = value;
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

  _addMedicine(BuildContext context) {
    bool validate = _addMedicineFormKey.currentState?.validate() ?? false;

    if (validate) {
      _addMedicineFormKey.currentState!.save();

      _addMedicineFormKey.currentState!.reset();

      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Transaction Completed Successfully!',
      );
    }
  }
}
