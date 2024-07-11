import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:tap_and_order/database/orderproduct_model.dart';
import 'package:tap_and_order/order_product/order_product_dialog.dart';

import 'product_model.dart';

class DatabaseProvider {
  static Database? database;
  var databasename = "productlist.db";

  DatabaseProvider() {
    createdatabase();
  }

  Future<Database> createdatabase() async {
    print("in create table 17");

    //  if (database == null) {
    try {
      if (kIsWeb) {
        var databasefactory = databaseFactoryFfiWeb;
        database = await databasefactory.openDatabase(databasename,
            options: OpenDatabaseOptions(
                version: 1,
                onCreate: (db, version) async {
                  await db.execute(
                      "CREATE TABLE addproduct (id INTEGER PRIMARY KEY AUTOINCREMENT, product TEXT, price double)");
                  await db.execute(
                      "CREATE TABLE orderproduct (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, contact INTEGER)");
                }));
      } else {
        var path = join(await getDatabasesPath(), databasename);
        database = await openDatabase(
          path,
          version: 1,
          onCreate: (db, version) async {
            await db.execute(
                "CREATE TABLE addproduct (id INTEGER PRIMARY KEY AUTOINCREMENT, product TEXT, price double)");
            await db.execute(
                "CREATE TABLE orderproduct (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, contact INTEGER)");
          },
        );
      }
    } catch (exception) {
      print("exception $exception");
    }
    //  }
    return Future.value(database);
  }

  void inserttap(ProductModel productmodel) async {
    var database = await createdatabase();
    database.insert("addproduct", productmodel.toJson());

    print("after insert");
  }

  Future<List<ProductModel>> getlist() async {
    var database = await createdatabase();
    final List<Map<String, dynamic>> maps = await database.query('addproduct');
    print("list ,$maps");
    return List.generate(maps.length, (i) {
      return ProductModel(
          id: maps[i]['id'],
          product: maps[i]['product'],
          price: maps[i]['price']);
    });
  }

  void updatetap(ProductModel productmodel) async {
    var database = await createdatabase();
    database.update("addproduct", productmodel.toJson(),
        where: "id = ?", whereArgs: [productmodel.id]);
  }

  void removetap(ProductModel productmodel) async {
    var database = await createdatabase();

    database.delete("addproduct", where: "id=?", whereArgs: [productmodel.id]);
  }

  void insert_product(ProductModel productmodel) async {
    var database = await createdatabase();
    database.insert("addproduct", productmodel.toJson());
  }

  Future<List<OrderproductModel>> setlist() async {
    var database = await createdatabase();
    final List<Map<String, dynamic>> maps = await database.query('addproduct');

    return List.generate(maps.length, (i) {
      return OrderproductModel(
          id: maps[i]['id'],
          name: maps[i]['product'],
          contact: maps[i]['price']);
    });
  }

  void insertorderproduct(OrderproductModel orderproductmodel) async {
    var database = await createdatabase();
    database.insert("orderproduct", orderproductmodel.toJson());
  }
}
