import 'package:flutter/material.dart';
import 'package:medicine_research/modules/user/user_add_order_screen.dart';
import 'package:medicine_research/widgets/column_text.dart';
import 'package:medicine_research/widgets/custom_button.dart';

class StaffStockMedicineDetails extends StatefulWidget {
  const StaffStockMedicineDetails({super.key, required this.image});

  final String image;

  @override
  State<StaffStockMedicineDetails> createState() => _StaffStockMedicineDetailsState();
}

class _StaffStockMedicineDetailsState extends State<StaffStockMedicineDetails> {
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
                                  text1: 'Name',
                                  text2:
                                      'Paracetamoluding tablets',
                                ),
                                sizedBox,
                                ColumnText(
                                    text1: 'Quantity',
                                    text2: '1000'),
                                sizedBox,
                                 ColumnText(
                                    text1: 'Unit',
                                    text2: 'dezon'),
                                sizedBox,
                                ColumnText(
                                    text1: 'Price:',
                                    text2: '100'
                                        ),
                                sizedBox,
                                
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
           
          
          ],
        ),
      ),
    );
  }
}
