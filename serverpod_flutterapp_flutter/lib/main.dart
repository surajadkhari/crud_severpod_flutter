import 'package:serverpod_flutterapp_client/serverpod_flutterapp_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_flutterapp_flutter/app/app.dart';
import 'package:serverpod_flutterapp_flutter/utils/app_const.dart';

var client = Client(AppConstant.baseUrl)
  ..connectivityMonitor = FlutterConnectivityMonitor();

final apiTodo = client.todo;

void main() {
  runApp(const ServerPodApp());
}
