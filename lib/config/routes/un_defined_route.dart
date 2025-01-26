import 'package:flutter/material.dart';

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(
        title: const Text("الصفحة غير موجودة"),
      ),
      body: const Center(
        child: Text('قم باعادة تشغيل التطبيق'),
      ),
    ),
  );
}
