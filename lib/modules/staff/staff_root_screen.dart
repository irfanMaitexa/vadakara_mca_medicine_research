import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicine_research/db/shared_pref.dart';
import 'package:medicine_research/modules/auth/login.dart';
import 'package:medicine_research/modules/staff/staff_medicine_view.dart';
import 'package:medicine_research/modules/staff/staff_order_view_screen.dart';
import 'package:medicine_research/modules/staff/staff_stock_root_screen.dart';
import 'package:medicine_research/modules/user/widgets/card_widget.dart';
import 'package:medicine_research/utils/constants.dart';
import 'package:http/http.dart' as http;

class StaffRootScreen extends StatefulWidget {
  const StaffRootScreen({super.key});

  @override
  State<StaffRootScreen> createState() => _StaffRootScreenState();
}

class _StaffRootScreenState extends State<StaffRootScreen> {


  bool _loading = false;

  Future<void> fetchProfileForStaff(String loginId) async {
    final url = Uri.parse('$baseUrl/api/profile/staff/$loginId');

    try {
      setState(() {
        _loading =true;
      });
      final response = await http.get(url);

      print(response.body);

      if (response.statusCode == 200) {

        setState(() {
          _loading = false;
        });
      } else {
        setState(() {
          _loading = false;
        });
      }
    } catch (e) {
      setState(() {
          _loading = false;
        });
    }
  }

  Future<void> updateAttendance() async {
    var url = Uri.parse(
        '$baseUrl/api/staff/attendance-med/${DbService.getLoginId()}');
    var body = {"isPresent": true};
    try {
      var response = await http.put(url, body: body);

      print(response.body);
      if (response.statusCode == 200) {
      } else {}
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {

    fetchProfileForStaff(DbService.getLoginId()!);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: KButtonColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _loading ? indicator  :Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: CardWidget(
                      iconData: Icons.inventory,
                      title: 'Attendence',
                      onTap: () {},
                      child: const Text(
                        '30',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardWidget(
                      iconData: Icons.inventory,
                      title: DateFormat.MMM().format(DateTime.now()),
                      onTap: () {},
                      child: Text(
                        DateFormat.d().format(DateTime.now()),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: KButtonColor),
              ),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: .97,
                children: [
                  CardWidget(
                    iconData: Icons.inventory,
                    title: 'Add Stock',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddMedicineStockRootScreen(),
                        ),
                      );
                    },
                  ),
                  CardWidget(
                    iconData: Icons.vaccines,
                    title: 'Manage medicine',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StaffMedicineViewScreen(),
                        ),
                      );
                    },
                  ),
                  CardWidget(
                    iconData: Icons.book,
                    title: 'View Order',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StaffViewOrderScreen(),
                        ),
                      );
                    },
                  ),
                  CardWidget(
                      iconData: Icons.logout,
                      title: 'Logout',
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (route) => false);
                      }),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ActionSlider.standard(
            backgroundColor: KButtonColor,
            toggleColor: Colors.white,
            backgroundBorderRadius: BorderRadius.circular(0.0),
            rolling: true,
            action: (controller) async {
              controller.loading();

              var url = Uri.parse(
                  '$baseUrl/api/staff/attendance-med/${DbService.getLoginId()}');
              var body = {"isPresent": 'true'};

              var response = await http.put(url, body: body);

              if (response.statusCode == 200) {
                controller.success();
              } else {
                if (context.mounted) {
                  customSnackBar(context: context, messsage: 'Faild');
                }
              }
            },

            child: const Text(
              'Slide to add attendence',
              style: TextStyle(color: Colors.white),
            ),
            //many more parameters
          )
        ],
      ),
    );
  }
}
