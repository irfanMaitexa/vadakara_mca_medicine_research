import 'package:flutter/material.dart';
import 'package:medicine_research/modules/auth/login.dart';
import 'package:medicine_research/modules/physcian/phy_add_medicine.dart';
import 'package:medicine_research/modules/physcian/phy_medicine_details.dart';
import 'package:medicine_research/modules/physcian/phy_search_screen.dart';
import 'package:medicine_research/widgets/custom_button.dart';

class PhyHomeViewScreen extends StatefulWidget {
  const PhyHomeViewScreen({super.key});

  @override
  State<PhyHomeViewScreen> createState() => _PhyHomeViewScreenState();
}

class _PhyHomeViewScreenState extends State<PhyHomeViewScreen> {
  final _medicineList = [
    'https://images.pexels.com/photos/159211/headache-pain-pills-medication-159211.jpeg',
    'https://images.pexels.com/photos/593451/pexels-photo-593451.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1424538/pexels-photo-1424538.jpeg?auto=compress&cs=tinysrgb&w=600',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PhySearchScreen()),
              );
            },
          ),
          actions: [
            const Text('Logout'),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false);
              },
            ),
          ]),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomButton(
          text: 'Add new medicine',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhyAddMedicineScreen(),
              ),
            );
          },
        ),
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
                    _medicineList.length,
                    (index) => GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey.shade200)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                _medicineList[index],
                                fit: BoxFit.fill,
                                height: 120,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Name',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: CustomButton(
                                      text: 'view more',
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PhyMedicineDetailsScreen(
                                              image: _medicineList[index],
                                            ),
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
                  )),
            ),
          )
        ],
      ),
    );
  }
}
