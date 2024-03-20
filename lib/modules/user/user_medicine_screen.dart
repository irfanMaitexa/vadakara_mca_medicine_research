import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medicine_research/modules/user/user_medicine_details.dart';
import 'package:medicine_research/utils/constants.dart';
import 'package:medicine_research/widgets/custom_button.dart';

class UserMedicineScreen extends StatefulWidget {
  const UserMedicineScreen({Key? key}) : super(key: key);

  @override
  State<UserMedicineScreen> createState() => _UserMedicineScreenState();
}

class _UserMedicineScreenState extends State<UserMedicineScreen> {
  final _searchController = TextEditingController();

  Future<List<dynamic>> _fetchMedicineData() async {
    final url = Uri.parse('$baseUrl/api/view-med');
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
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 55,
            child: TextField(
              enabled: true,
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  gapPadding: 0,
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: _fetchMedicineData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<dynamic> medicineList = snapshot.data ?? [];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      childAspectRatio: .55,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                      children: List.generate(
                        medicineList.length,
                        (index) => GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 150,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.grey.shade200),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    'https://images.pexels.com/photos/159211/headache-pain-pills-medication-159211.jpeg',
                                    fit: BoxFit.fill,
                                    height: 120,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        medicineList[index]['medicine'],
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
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: CustomButton(
                                          text: 'view more',
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    UserMedicineDetails(
                                                        medicineDetails:
                                                            medicineList[
                                                                index]),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}



