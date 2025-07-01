import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/facebook_login_view_model.dart';

class FacebookLoginPage extends StatelessWidget {
  const FacebookLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FacebookLoginViewModel>();
    final user = viewModel.user;

    return Scaffold(
      appBar: AppBar(title: const Text('Facebook Login')),
      body: Center(
        child: user == null
            ? ElevatedButton(
                onPressed: viewModel.login,
                child: const Text('Login with Facebook'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Name: ${user.name}"),
                  Text("Email: ${user.email}"),
                  ElevatedButton(
                    onPressed: viewModel.logout,
                    child: const Text('Logout'),
                  ),
                ],
              ),
      ),
    );
  }
}
