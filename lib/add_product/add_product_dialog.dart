import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tap_and_order/home_screens/home_screen.dart';
import 'package:tap_and_order/database/product_model.dart';

class AddProductDialog extends StatefulWidget {
  const AddProductDialog({
    super.key,
  });

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  var productNameController = TextEditingController();
  var pricecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(19, 20, 0, 0),
                child: Text("Enter product"),
              ),
              Container(
                width: 150,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 5, 0),
                  child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: productNameController),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(22, 20, 0, 0),
                child: Text("Enter price"),
              ),
              Container(
                width: 150,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(19, 20, 0, 0),
                  child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: pricecontroller),
                ),
              ),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: ElevatedButton(
                    onPressed: () {
                      //Validations
                      ProductModel productModel = ProductModel(
                        product: productNameController.text.toString(),
                        price: double.parse(pricecontroller.text.toString()),
                      );
                      Navigator.of(context).pop(productModel);
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.black),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
