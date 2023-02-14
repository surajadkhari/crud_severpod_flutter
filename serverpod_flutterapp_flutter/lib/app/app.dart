import 'package:flutter/material.dart';
import 'package:serverpod_flutterapp_flutter/dashboard.dart';
import 'package:serverpod_flutterapp_flutter/utils/app_const.dart';

class ServerPodApp extends StatelessWidget {
  const ServerPodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
          fontFamily: AppConstant.appFont,
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  textStyle: const TextStyle(fontSize: 14, color: Colors.white),
                  maximumSize: const Size.fromHeight(52)))
          // primarySwatch: Colors.blue,
          ),
      home: const Home(title: 'Serverpod Todo'),
    );
  }
}
