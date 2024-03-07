import 'package:flutter/material.dart';
import 'package:medicine_research/modules/user/user_medicine_details.dart';
import 'package:medicine_research/widgets/custom_button.dart';

class UserPhysicianScreen extends StatefulWidget {
  const UserPhysicianScreen({super.key});

  @override
  State<UserPhysicianScreen> createState() => _UserPhysicianScreenState();
}

class _UserPhysicianScreenState extends State<UserPhysicianScreen> {
  final _searchController = TextEditingController();

  final _physicianList = [
    'https://www.stockvault.net/data/2015/09/01/177580/preview16.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Our Physcians'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  childAspectRatio: .55,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  children: List.generate(
                    _physicianList.length,
                    (index) => GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 150,
                        decoration: const BoxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              _physicianList[index],
                              fit: BoxFit.fill,
                              height: 120,
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    border: Border.all(
                                        color: Colors.grey.shade200)),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
