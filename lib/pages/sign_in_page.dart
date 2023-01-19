import 'package:flutter/material.dart';
import 'package:flutter_app_with_docs_and_my_value/core/i_auth_service.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final serviceInstance = Provider.of<IAuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In Page'),
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                final email = 'Halilmertdeveliii@gmail.com';
                final password = '123456789';

                serviceInstance.createUserEmailAndPassword(
                    email: email, password: password);
              },
              child: Text('Sign up'),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final email = 'Halilmertdeveliii@gmail.com';
                final password = '123456789';

                serviceInstance.signInEmailAndPassword(
                    email: email, password: password);
              },
              child: Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
