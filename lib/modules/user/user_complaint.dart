import 'package:flutter/material.dart';
import 'package:medicine_research/widgets/custom_button.dart';
import 'package:medicine_research/widgets/custom_text_field.dart';

class UserComplaintScreen extends StatelessWidget {
  UserComplaintScreen({super.key});

  final _complaint = TextEditingController();


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Add your complaint',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'Add your complaint',
              controller: _complaint,
              borderColor: Colors.grey,
              maxLines: 200,
              minLine: 6,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomButton(text: 'Submit', onPressed: () {
                
              },),
            )
          ],
        ),
      ),
    );
  }
}
