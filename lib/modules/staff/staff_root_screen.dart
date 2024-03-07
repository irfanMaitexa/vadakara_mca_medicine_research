import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicine_research/modules/auth/login.dart';
import 'package:medicine_research/modules/staff/add_medicine_stock_screen.dart';
import 'package:medicine_research/modules/staff/manage_medicine_screen.dart';
import 'package:medicine_research/modules/staff/staff_view_order_screen.dart';
import 'package:medicine_research/modules/user/widgets/card_widget.dart';
import 'package:medicine_research/utils/constants.dart';

class StaffRootScreen extends StatefulWidget {
  const StaffRootScreen({super.key});

  @override
  State<StaffRootScreen> createState() => _StaffRootScreenState();
}

class _StaffRootScreenState extends State<StaffRootScreen> {
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
      body: Column(
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
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 10),
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
                          builder: (context) => const AddMedicineStockScreen(),
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
                          builder: (context) =>
                              const StaffManageMedicineScreen(),
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
          SizedBox(
            height: 10,
          ),
          ActionSlider.standard(
            backgroundColor: KButtonColor,
            toggleColor: Colors.white,
            backgroundBorderRadius: BorderRadius.circular(0.0),
            rolling: true,
            action: (controller) async {
              controller.loading();
              await Future.delayed(const Duration(seconds: 3));
              controller.success();
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
