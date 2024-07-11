import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tap_and_order/database/product_model.dart';

class EditProductDialog extends StatefulWidget {
  final ProductModel productModel;
  const EditProductDialog({super.key, required this.productModel});

  @override
  State<EditProductDialog> createState() => _EditProductDialogState();
}

class _EditProductDialogState extends State<EditProductDialog> {
  var productNamecontroller = TextEditingController();
  var priceController = TextEditingController();
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
                padding: EdgeInsets.fromLTRB(17, 20, 5, 0),
                child: Text("Enter product"),
              ),
              Container(
                  width: 150,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(13, 20, 0, 0),
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: productNamecontroller,
                    ),
                  ))
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 19, 0),
                child: Text("Enter price"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(11, 20, 0, 0),
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: priceController,
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  if (productNamecontroller.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Enter Details first");
                  } else if (priceController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Enter Price of item");
                  } else {
                    widget.productModel.product =
                        productNamecontroller.text.toString();
                    widget.productModel.price =
                        double.parse(priceController.text.toString());

                    Navigator.of(context).pop(widget.productModel);
                  }
                },
                child: Text("Update")),
          )
        ],
      ),
    );
    ;
  }
}
