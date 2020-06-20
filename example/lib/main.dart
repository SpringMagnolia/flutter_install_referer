import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_install_referer/flutter_install_referer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map _refererInfo;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    Map<String,dynamic> refererInfo;
    try {
      refererInfo = await FlutterInstallReferer.installReferer;
    } on PlatformException {
      refererInfo = Map();
    }

    if (!mounted) return;

    setState(() {
      _refererInfo = refererInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_install_referer'),
        ),
        body: Center(
          child: Text('Referer Info: \n$_refererInfo'),
        ),
      ),
    );
  }
}
