import 'package:flutter/material.dart';
import 'package:tap_and_order/database/database.dart';
import 'package:tap_and_order/add_product/product_edit_dialog.dart';
import 'package:tap_and_order/add_product/add_product_dialog.dart';
import 'package:tap_and_order/database/product_model.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenScreenState();
}

class _ProductListScreenScreenState extends State<ProductListScreen> {
  var list = <ProductModel>[];

  DatabaseProvider databaseProvider = DatabaseProvider();

  // var currentindex = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlist();
  }

  getlist() async {
    list.addAll(await databaseProvider.getlist());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Products",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 104, 91, 225),
                            Color.fromARGB(255, 73, 161, 232)
                          ]),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Text(list[index].product ?? ""),
                                Text(list[index].price.toString()),
                              ])),
                          Spacer(),
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.edit),
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => EditProductDialog(
                                      productModel: list[index])).then((value) {
                                list[index] = value;
                                databaseProvider.updatetap(list[index]);

                                setState(() {});
                              });
                            },
                          ),
                          InkWell(
                              onTap: () {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        child: Wrap(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  'Do you really want to delete this item?'),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    list.removeAt(index);
                                                    Navigator.of(context).pop();
                                                    setState(() {});
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 0, 10, 0),
                                                    child: Text('yes'),
                                                  )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 0, 10, 0),
                                                    child: Text('No'),
                                                  )),
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.delete),
                              ))
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => AddProductDialog())
              .then((value) {
            var object = value as ProductModel;
            if (value != null) {
              ProductModel productModel =
                  ProductModel(product: object.product, price: object.price);
              databaseProvider.insert_product(productModel);

              // list.add(productModel);
              setState(() {
                list.add(productModel);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
