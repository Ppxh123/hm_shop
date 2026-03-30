import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

// 根路由
Widget getRootWidget() {
  return MaterialApp(
    initialRoute: '/',
    routes: getRootRoutes(),
  );
}

// 放回改APP的路由配置
Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    '/': (context) => MainPage(),
    '/login': (context) => LoginPage(), 
  };
}