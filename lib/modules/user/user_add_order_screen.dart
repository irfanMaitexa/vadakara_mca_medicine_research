import 'package:flutter/material.dart';
import 'package:medicine_research/modules/user/user_medicine_details.dart';
import 'package:medicine_research/modules/user/user_order_confiramation_screen.dart';
import 'package:medicine_research/widgets/column_text.dart';
import 'package:medicine_research/widgets/custom_button.dart';
import 'package:medicine_research/widgets/custom_text_field.dart';

class UserAddOrderScreen extends StatefulWidget {
  const UserAddOrderScreen({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  State<UserAddOrderScreen> createState() => _UserAddOrderScreenState();
}

class _UserAddOrderScreenState extends State<UserAddOrderScreen> {
  final _quantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ColumnText(
                      text1: 'Description',
                      text2:
                          'Paracetamol is available in various forms, including tablets, capsules, liquid, and effervescent tablets. It is often combined with other medications, such as codeine, to enhance its pain-relieving effects.',
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Quantity',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: 'Enter Quantity',
                      controller: _quantityController,
                      borderColor: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                text: 'Place Order',
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) => const OrderConfirmScreen(),
                    ), (route) => false);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
