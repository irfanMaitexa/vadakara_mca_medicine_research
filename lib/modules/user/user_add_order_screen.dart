import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medicine_research/db/shared_pref.dart';
import 'package:medicine_research/modules/user/payment_screen.dart';
import 'package:medicine_research/modules/user/user_order_confiramation_screen.dart';
import 'package:medicine_research/utils/constants.dart';
import 'package:medicine_research/widgets/column_text.dart';
import 'package:medicine_research/widgets/custom_button.dart';
import 'package:medicine_research/widgets/custom_text_field.dart';
import 'package:http/http.dart' as http;

class UserAddOrderScreen extends StatefulWidget {
  const UserAddOrderScreen(
      {super.key,
      required this.imageUrl,
      required this.description,
      required this.name,
      required this.price,
      required this.id});

  final String imageUrl;
  final String description;
  final String name;
  final String price;
  final String id;

  @override
  State<UserAddOrderScreen> createState() => _UserAddOrderScreenState();
}

class _UserAddOrderScreenState extends State<UserAddOrderScreen> {
  final _quantityController = TextEditingController();

  bool _loading = false;

  bool  isPaid  = false;
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColumnText(text1: 'Name', text2: widget.name),
                      const SizedBox(
                        height: 25,
                      ),
                      ColumnText(
                          text1: 'Description', text2: widget.description),
                      const SizedBox(
                        height: 25,
                      ),
                      ColumnText(text1: 'Price', text2: widget.price),
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
                     isPaid ?   Text(
                        _quantityController.text,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ) :CustomTextField(
                        hintText: 'Enter Quantity',
                        controller: _quantityController,
                        borderColor: Colors.grey,
                      )

                      ,SizedBox(height: 10,),
                      if(isPaid)
                      ColumnText(text1: 'Price', text2:getPrice())
                    ],
                  ),
                ),
              ),
            ),

            
            _loading
                ? indicator
                : Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CustomButton(
                      text: 'Place Order',
                      onPressed: () async{
                        if(isPaid){
                          orderMedicine();

                        

                        }else{

                         if(_quantityController.text.isNotEmpty){

                          isPaid = await Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen(),));
                         if(isPaid){
                          setState(() {
                            
                          });
                         }
                         }else{

                          customSnackBar(context: context, messsage: 'Fill Quantity');
                         }
                        }

                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }

  String getPrice(){

    var res = int.parse(widget.price) * int.parse(_quantityController.text);

    return  res.toString();
  }

  Future<void> orderMedicine() async {
    if (_quantityController.text.isNotEmpty) {
      var url = Uri.parse(
          '$baseUrl/api/user/order-med/${DbService.getLoginId()}/${widget.id}');

      var body = {'unit': _quantityController.text.trim()};

      try {
        setState(() {
          _loading = true;
        });

        var response = await http.post(
          url,
          body: body,
        );

        var data = jsonDecode(response.body);

       

        if (response.statusCode == 201) {
          if (context.mounted) {



            Navigator.push(context,MaterialPageRoute(builder: (context) => const OrderConfirmScreen(),));
            customSnackBar(context: context, messsage: data["Message"]);
          }

          _loading = false;
        } else {
          setState(() {
            _loading = false;
          });
        }
      } catch (e) {
        customSnackBar(context: context, messsage: 'Something went wrong');
      }
    } else {
      customSnackBar(context: context, messsage: 'Quantity required');
    }
  }
}
