import 'package:flutter/material.dart';
import 'package:tap_and_order/database/database.dart';
import 'package:tap_and_order/database/orderproduct_model.dart';
import 'package:tap_and_order/order_product/order_product_dialog.dart';
import 'package:tap_and_order/database/product_model.dart';

class ProductMenue extends StatefulWidget {
  const ProductMenue({super.key});

  @override
  State<ProductMenue> createState() => _ProductMenueState();
}

class _ProductMenueState extends State<ProductMenue> {
  var list = <OrderproductModel>[];
  // var currentindex = "Burger";
  DatabaseProvider databaseProvider = DatabaseProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setlist();
  }

  setlist() async {
    list.addAll(await databaseProvider.setlist());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Menu"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 104, 91, 225),
                          Color.fromARGB(255, 73, 161, 232)
                        ]),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(list[index].name ?? ''),
                            Text(list[index].contact.toString()),
                          ],
                        ),
                      ),
                      Spacer(),
                    ]),
                  ),
                );
              })
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => Orderproduct())
              .then((value) {
            var addorder = value as OrderproductModel;
            if (value != null) {
              OrderproductModel orderproductModel = OrderproductModel(
                  name: addorder.name, contact: addorder.contact);
              databaseProvider.insertorderproduct(orderproductModel);

              setState(() {
                list.add(addorder);
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
