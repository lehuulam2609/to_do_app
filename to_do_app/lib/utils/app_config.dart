import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// Environment of the app
class AppEnvironment {
  bool isDev;
  AppEnvironment._(
      {@required this.apiBaseUrl,
      @required this.imageUrl,
      this.isDev = true});

  final String apiBaseUrl;
  final String imageUrl;

  factory AppEnvironment.dev() {
    return AppEnvironment._(
      apiBaseUrl: "https://my-json-server.typicode.com/imkhan334/demo-1",
      imageUrl: 'https://resources.waki.me',
      isDev: true,
    );
  }

  factory AppEnvironment.live() {
    return AppEnvironment._(
      apiBaseUrl: "https://my-json-server.typicode.com/imkhan334/demo-1",
      imageUrl: 'https://resources.waki.sa/',
      isDev: false,
    );
  }
}
