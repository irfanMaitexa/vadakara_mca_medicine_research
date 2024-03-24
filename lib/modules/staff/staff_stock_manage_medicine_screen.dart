import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medicine_research/modules/staff/staff_update_stock.dart';
import 'package:medicine_research/modules/staff/stock_medicine_details.dart';
import 'package:medicine_research/utils/constants.dart';
import 'package:medicine_research/widgets/custom_button.dart';
import 'package:http/http.dart' as http;

class StaffStockManageMedicineScreen extends StatefulWidget {
  const StaffStockManageMedicineScreen({super.key});

  @override
  State<StaffStockManageMedicineScreen> createState() =>
      _StaffStockManageMedicineScreenState();
}

class _StaffStockManageMedicineScreenState
    extends State<StaffStockManageMedicineScreen> {
  final _searchController = TextEditingController();

  final _medicineList = [
    'https://images.pexels.com/photos/159211/headache-pain-pills-medication-159211.jpeg',
    'https://images.pexels.com/photos/593451/pexels-photo-593451.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1424538/pexels-photo-1424538.jpeg?auto=compress&cs=tinysrgb&w=600',
  ];

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
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
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
                borderSide: BorderSide(color: Colors.grey.shade300),
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
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<dynamic> data = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    childAspectRatio: .5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                    children: List.generate(
                      data.length,
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StaffStockMedicineDetails(
                                data: data[index],
                              ),
                            ),
                          );
                        },
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
                                  data[index]['image'],
                                  fit: BoxFit.fill,
                                  height: 120,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index]['medicine'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: CustomButton(
                                        text: 'view more',
                                        color: KButtonColor,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  StaffStockMedicineDetails(
                                                data: data[index],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
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
        ),
     
     
     
     
      ],
    );
  }

  void _deleteStock() {
    print('delete');
  }
}
