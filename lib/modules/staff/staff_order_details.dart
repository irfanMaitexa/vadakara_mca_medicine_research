import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medicine_research/utils/constants.dart';
import 'package:medicine_research/widgets/column_text.dart';
import 'package:medicine_research/widgets/custom_button.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:http/http.dart' as http;

class StaffMedicineDetails extends StatefulWidget {
  const StaffMedicineDetails(
      {super.key, required this.image, required this.details});

  final String image;

  final Map<String, dynamic> details;

  @override
  State<StaffMedicineDetails> createState() => _StaffMedicineDetailsState();
}

class _StaffMedicineDetailsState extends State<StaffMedicineDetails> {
  @override
  Widget build(BuildContext context) {
    print(widget.details);
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
                      padding: const EdgeInsets.all(10),
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
                    Expanded(
                        flex: 2,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sizedBox,
                                ColumnText(
                                    text1: 'Quantitiy:',
                                    text2: widget.details['quantity']),
                                sizedBox,
                                ColumnText(
                                    text1: 'Description',
                                    text2: widget.details['description']),
                                sizedBox,
                                ColumnText(
                                  text1: 'Price',
                                  text2: widget.details['price'].toString(),
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

  _orderConfirmation(BuildContext context) async {
    final response = await http
        .put(Uri.parse('$baseUrl/api/staff/order-status-update/${widget.details['_id']}'));

        

    

    if (response.statusCode == 200) {
      if(context.mounted){
        QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Transaction Completed Successfully!',
      );
      }
    } else {
     if(context.mounted){

      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: 'Error!',
      );

     }
    }
  }
}
