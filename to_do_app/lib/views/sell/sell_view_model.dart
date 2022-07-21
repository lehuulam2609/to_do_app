import 'package:flutter/material.dart';
import 'package:to_do_app/core/viewmodel/base_viewmodel.dart';
import 'package:get/get.dart';
import 'package:to_do_app/models/remote/order_model.dart';
import 'package:to_do_app/services/local_storage/sqlite_storage.dart';
import 'package:to_do_app/utils/app_helper.dart';

class SellViewModel extends BaseViewModel {
  final SQLiteStorage sqLiteStorage;
  SellViewModel({
    @required this.sqLiteStorage,
  });

  Rx<bool> isLoading = Rx<bool>(false);
  Rx<List<OrderModel>> listOrders = Rx<List<OrderModel>>([]);

  @override
  void onInit() async {
    super.onInit();

    /// Get List Api
    this.getListOrdersApi();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //////////////////////////////////////////////////////
  /// Get List Order
  //////////////////////////////////////////////////////
  void getListOrdersApi() async {
    listOrders.value = await sqLiteStorage.getListSell();
    if (listOrders.value.length == 0) {
      /// Insert Dummy Data
      final list = [
        OrderModel(
          id: 1,
          name: 'iPhone X',
          price: 150000,
          quantity: 1,
          type: 2,
        ),
        OrderModel(
          id: 2,
          name: 'TV',
          price: 38000,
          quantity: 2,
          type: 2,
        ),
        OrderModel(
          id: 3,
          name: 'Table',
          price: 12000,
          quantity: 1,
          type: 2,
        ),
      ];
      /// Save/get Data
      await sqLiteStorage.insertListSell(list);
      listOrders.value = await sqLiteStorage.getListSell();
    }
  }
}
