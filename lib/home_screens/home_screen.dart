import 'package:flutter/material.dart';
import 'package:tap_and_order/order_product/prduct_menu_screen.dart';
import 'package:tap_and_order/add_product/product_list_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var list = ["Burger ", "Pizza  ", "Drinks "];
  var selectedValue = "Burger ";
  var current_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 73, 161, 232),
        title: Text(
          'Home Screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      //   current_index == 0 ? ProductMenue() : ProductListScreen(),
      body: Container(
          child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            DropdownButton(
                value: selectedValue,
                items: list.map((value) {
                  return DropdownMenuItem(child: Text(value), value: value);
                }).toList(),
                onChanged: (String? value) {
                  selectedValue = value ?? '';
                  setState(() {});
                }),
          ],
        ),
      )),
      // bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: Color.fromARGB(255, 73, 161, 232),
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: InkWell(
      //             onTap: () {
      //               current_index = 0;
      //               setState(() {});

      //               // Navigator.of(context).push(MaterialPageRoute(
      //               //     builder: (context) => ProductMenue()));
      //             },
      //             child: Icon(
      //               Icons.lunch_dining,
      //               color: Colors.black,
      //             ),
      //           ),
      //           label: "Menue"),
      //       BottomNavigationBarItem(
      //         icon: InkWell(
      //             onTap: () {
      //               current_index = 1;
      //               setState(() {});
      //               // Navigator.of(context).push(MaterialPageRoute(
      //               //     builder: (context) => ProductListScreen()));
      //             },
      //             child: const Icon(
      //               Icons.food_bank_rounded,
      //               color: Colors.black,
      //             )),
      //         label: "Products",
      //       ),
      //     ]),
    );
  }
}
