import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tap_and_order/database/orderproduct_model.dart';

class Orderproduct extends StatefulWidget {
  const Orderproduct({super.key});

  @override
  State<Orderproduct> createState() => _OrderproductState();
}

class _OrderproductState extends State<Orderproduct> {
  var Customernamecontroller = TextEditingController();
  var customercontactconrtroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Bill For",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12, 20, 5, 0),
              child: Text("Enter Name"),
            ),
            Container(
              width: 150,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 0, 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                      controller: Customernamecontroller,
                      decoration:
                          InputDecoration(border: OutlineInputBorder())),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 19, 0),
              child: Text("Enter Number"),
            ),
            Container(
              width: 150,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 16, 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextField(
                      controller: customercontactconrtroller,
                      decoration:
                          InputDecoration(border: OutlineInputBorder())),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            0,
            20,
            0,
            10,
          ),
          child: ElevatedButton(
              onPressed: () {
                if (Customernamecontroller.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Enter Details First");
                } else if (customercontactconrtroller.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Enter Details First");
                } else {
                  OrderproductModel orderproductModel = OrderproductModel(
                    name: Customernamecontroller.toString(),
                    contact: int.parse(customercontactconrtroller.toString()),
                  );
                  Navigator.of(context).pop(orderproductModel);
                  setState(() {});
                }
              },
              child: Text(
                "Add to Cart",
                style: TextStyle(color: Colors.black),
              )),
        )
      ]),
    );
  }
}
