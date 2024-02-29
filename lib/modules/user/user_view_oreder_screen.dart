import 'package:flutter/material.dart';
import 'package:medicine_research/utils/constants.dart';

class UserViewOrderScreen extends StatefulWidget {
  const UserViewOrderScreen({super.key});

  @override
  State<UserViewOrderScreen> createState() => _UserViewOrderScreenState();
}

class _UserViewOrderScreenState extends State<UserViewOrderScreen> {


  final orderList = [
    'https://images.pexels.com/photos/159211/headache-pain-pills-medication-159211.jpeg',
    'https://images.pexels.com/photos/593451/pexels-photo-593451.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1424538/pexels-photo-1424538.jpeg?auto=compress&cs=tinysrgb&w=600',
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body:  ListView.builder(
              itemCount: orderList.length,
              itemBuilder: (context, index) => Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
               
                child: Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(20)),
                        child: Image(
                          fit: BoxFit.fitHeight,
                          image: NetworkImage(orderList[index]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                     Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Medicine 1',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'quatity:10',
                            style: TextStyle(
                                color: Colors.grey.shade300,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            'completed',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}