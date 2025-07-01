import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/facebook_login_page.dart';
import 'view_models/facebook_login_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FacebookLoginViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Facebook MVVM', home: const FacebookLoginPage());
  }
}
