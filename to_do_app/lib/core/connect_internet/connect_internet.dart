import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

mixin NetworkAwareState<T extends StatefulWidget> on State<T> {
  bool _isDisconnected = false;

  StreamSubscription<ConnectivityResult> _networkSubscription;
  final Connectivity _connectivity = Connectivity();

  void onReconnected();

  void onDisconnected();

  bool firstCallback = true;

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on Exception catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  @override
  void initState() {
    super.initState();
    //listen to network changes
    initConnectivity();
    _networkSubscription = _connectivity.onConnectivityChanged.listen((result) {
      _updateConnectionStatus(result);
    });
  }

  _updateConnectionStatus(ConnectivityResult result) {
    if (result != ConnectivityResult.none) {
      if (_isDisconnected) {
        onReconnected();
        _isDisconnected = false;
      }
    } else {
      _isDisconnected = true;
      onDisconnected();
    }
  }

  @override
  void dispose() {
    cancelSubscription();
    super.dispose();
  }

  void cancelSubscription() {
    try {
      _networkSubscription?.cancel();
    } catch (e) {
      print(e);
    }
  }
}
