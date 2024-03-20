import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:medicine_research/modules/user/user_add_order_screen.dart';
import 'package:medicine_research/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserViewStockSceeen extends StatefulWidget {
  const UserViewStockSceeen({super.key});

  @override
  State<UserViewStockSceeen> createState() => _UserViewStockSceeenState();
}

class _UserViewStockSceeenState extends State<UserViewStockSceeen> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
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

                      return ListView.builder(
                        itemCount: _medicineList.length,
                        itemBuilder: (context, index) => Container(
                          height: 150,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: KButtonColor)),
                          child: Stack(
                            children: [
                              Row(
                                textBaseline: TextBaseline.alphabetic,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 150,
                                      child: ClipRRect(
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                                right: Radius.circular(20)),
                                        child: Image(
                                          fit: BoxFit.fitHeight,
                                          image: NetworkImage(
                                              _medicineList[index]),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                   Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          medicineList[index]['medicine'],
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          'Unit:${medicineList[index]['stock']}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          medicineList[index]['price'].toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UserAddOrderScreen(
                                          id: medicineList[index]['_id'],
                                          description: medicineList[index]
                                              ['description'],
                                          name: medicineList[index]['medicine'],
                                          price: medicineList[index]['price']
                                              .toString(),
                                          imageUrl:
                                              'https://images.pexels.com/photos/159211/headache-pain-pills-medication-159211.jpeg',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Order Now >',
                                    style: TextStyle(
                                        color: KButtonColor, fontSize: 16),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  }))
        ],
      ),
    );
  }
}
