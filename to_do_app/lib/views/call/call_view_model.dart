import 'package:flutter/material.dart';
import 'package:to_do_app/core/viewmodel/base_viewmodel.dart';
import 'package:get/get.dart';
import 'package:to_do_app/models/remote/contact_model.dart';
import 'package:to_do_app/services/api/to_do_api.dart';
import 'package:to_do_app/utils/app_helper.dart';

class CallViewModel extends BaseViewModel {
  final ToDoApi toDoApi;
  CallViewModel({
    @required this.toDoApi,
  });

  Rx<bool> isLoading = Rx<bool>(false);
  Rx<List<ContactModel>> listContacts = Rx<List<ContactModel>>([]);

  @override
  void onInit() async {
    super.onInit();
    /// Get List Api
    this.getListContactsApi();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //////////////////////////////////////////////////////
  /// Get List Contacts
  //////////////////////////////////////////////////////
  void getListContactsApi() async {
    isLoading(true);
    var response = await toDoApi.getListContacts();
    isLoading(false);
    if (response.hasError ?? false) {
      if ((response.errors ?? []).length > 0) {
        AppHelper.showError(response.errors.first.message ?? '');
      }
    } else {
      listContacts.value = response.response ?? [];
    }
  }
}
