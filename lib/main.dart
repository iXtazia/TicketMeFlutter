import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FacebookLoginPage());
  }
}

class FacebookLoginPage extends StatefulWidget {
  const FacebookLoginPage({super.key});

  @override
  _FacebookLoginPageState createState() => _FacebookLoginPageState();
}

class _FacebookLoginPageState extends State<FacebookLoginPage> {
  Map<String, dynamic>? _userData;
  Future<void> _login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    print("ici${result.status}");

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      setState(() => _userData = userData);
    } else {
      print(result.status);
      print(result.message);
    }
  }

  Future<void> _logout() async {
    await FacebookAuth.instance.logOut();
    setState(() => _userData = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Facebook Login")),
      body: Center(
        child: _userData == null
            ? ElevatedButton(
                onPressed: _login,
                child: Text("Login with Facebook"),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Name: ${_userData!['name']}"),
                  Text("Email: ${_userData!['email']}"),
                  ElevatedButton(onPressed: _logout, child: Text("Logout")),
                ],
              ),
      ),
    );
  }
}
