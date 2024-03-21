import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medicine_research/utils/constants.dart';

import 'package:http/http.dart' as http;

class UserPhysicianScreen extends StatefulWidget {
  const UserPhysicianScreen({super.key});

  @override
  State<UserPhysicianScreen> createState() => _UserPhysicianScreenState();
}

class _UserPhysicianScreenState extends State<UserPhysicianScreen> {
  final _searchController = TextEditingController();

  final _physicianList = [
    'https://www.stockvault.net/data/2015/09/01/177580/preview16.jpg',
    'https://www.stockvault.net/data/2015/09/01/177580/preview16.jpg',
  ];

  Future<List<dynamic>> _fetchphy() async {
    final url = Uri.parse('$baseUrl/api/view-physicians');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      final List<dynamic> data = jsonData['data'];
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Our Physcians'),
      ),
      body: FutureBuilder(
        future: _fetchphy(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<dynamic> data = snapshot.data ?? [];

            return Column(
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
                        data.length,
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
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index]['name'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          data[index]['phone'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(
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
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
