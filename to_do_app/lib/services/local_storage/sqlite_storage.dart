import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/models/remote/order_model.dart';
import 'package:to_do_app/utils/app_constant.dart';

abstract class SQLiteStorage {
  void dispose();

  /// List Order
  Future<void> insertListSell(List<OrderModel> list);
  Future<List<OrderModel>> getListSell();
}

class SQLiteStorageIpml implements SQLiteStorage {
  final Database db;
  SQLiteStorageIpml({
    @required this.db,
  });

  // Closes all Hive boxes
  @override
  void dispose() {
    Hive.close();
  }

  ////////////////////////////////////////////////////////////////
  /// Insert/Get List Sell
  ////////////////////////////////////////////////////////////////
  @override
  Future<void> insertListSell(List<OrderModel> list) async {
    final listMap = list.map((i) => i.toJson()).toList();
    for (var item in listMap) {
      await db.transaction((txn) {
        return txn.rawInsert(
          '''INSERT INTO "${SQLiteDatabaseConstant.itemToSell}"("id", "name", "price", "quantity", "type") VALUES(?, ?, ?, ?, ?);''',
          [item["id"], item["name"], item["price"], item["quantity"], item["type"]],
        );
      });
    }
  }

  @override
  Future<List<OrderModel>> getListSell() async {
    List<Map> list =
        await db.rawQuery('SELECT * FROM ${SQLiteDatabaseConstant.itemToSell}');
    if (list != null) {
      return list.map((orders) => OrderModel.fromJson(orders)).toList();
    }
    return [];
  }
}
