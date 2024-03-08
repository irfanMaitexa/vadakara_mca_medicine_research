import 'package:flutter/material.dart';
import 'package:medicine_research/modules/user/user_add_order_screen.dart';
import 'package:medicine_research/widgets/column_text.dart';
import 'package:medicine_research/widgets/custom_button.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class StaffMedicineDetails extends StatefulWidget {
  const StaffMedicineDetails({super.key, required this.image});

  final String image;

  @override
  State<StaffMedicineDetails> createState() => _StaffMedicineDetailsState();
}

class _StaffMedicineDetailsState extends State<StaffMedicineDetails> {
  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(
      height: 10,
    );
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 30,
        ),
        child: Column(
          children: [
            Expanded(
              child: Card(
                elevation: 1,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Expanded(
                        flex: 2,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ColumnText(
                                  text1: 'Suppliar name',
                                  text2:'abc'
                                ),
                                sizedBox,
                                ColumnText(
                                    text1: 'Address',
                                    text2: 'Abc street'),
                                sizedBox,
                                ColumnText(
                                    text1: 'Quantitiy:',
                                    text2: '20'
                                    ),
                                sizedBox,
                                ColumnText(
                                  text1: 'Description',
                                  text2:
                                      'Paracetamol is available in various forms, including tablets, capsules, liquid, and effervescent tablets. It is often combined with other medications, such as codeine, to enhance its pain-relieving effects.',
                                ),
                               
                            
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomButton(
                text: 'Confirm',
                onPressed: () {

                  _orderConfirmation(context);
                  
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _orderConfirmation(BuildContext context){


    QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Transaction Completed Successfully!',
      );

    
  }


}
