import 'package:flutter/material.dart';
import 'package:medicine_research/modules/user/user_add_order_screen.dart';
import 'package:medicine_research/utils/constants.dart';
import 'package:medicine_research/widgets/custom_button.dart';

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
            child: ListView.builder(
              itemCount: _medicineList.length,
              itemBuilder: (context, index) => Container(
                height: 150,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration:
                    BoxDecoration(border: Border.all(color: KButtonColor)),
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
                              borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(20)),
                              child: Image(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(_medicineList[index]),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              SizedBox(height: 10,),

                              Text(
                                'Medicine 1',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Unit:1 doz',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '100',
                                style: TextStyle(
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
                                builder: (context) =>  UserAddOrderScreen(imageUrl: _medicineList[index],),
                              ));
                        },
                        child: Text(
                          'Order Now >',
                          style: TextStyle(color: KButtonColor, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
