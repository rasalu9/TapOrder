import 'package:flutter/material.dart';
import 'package:tap_and_order/order_product/prduct_menu_screen.dart';
import 'package:tap_and_order/home_screens/home_screen.dart';
// import 'package:tap_and_order/prduct_menu_screen.dart';
import 'package:tap_and_order/add_product/product_list_screen.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  var curent_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: curent_index == 0
            ? Homescreen()
            : curent_index == 1
                ? ProductMenue()
                : ProductListScreen(),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 73, 161, 232),
            items: [
              BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      curent_index = 0;

                      setState(() {});

                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => ProductMenue()));
                    },
                    child: Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      curent_index = 1;

                      setState(() {});

                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => ProductMenue()));
                    },
                    child: Icon(
                      Icons.lunch_dining,
                      color: Colors.black,
                    ),
                  ),
                  label: "Menu"),
              BottomNavigationBarItem(
                icon: InkWell(
                    onTap: () {
                      curent_index = 2;

                      setState(() {});
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => ProductListScreen()));
                    },
                    child: const Icon(
                      Icons.food_bank_rounded,
                      color: Colors.black,
                    )),
                label: "Products",
              ),
            ]));
  }
}
