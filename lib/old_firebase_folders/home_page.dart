import 'package:flutter/material.dart';
import 'package:flutter_app_with_docs_and_my_value/old_firebase_folders/core/i_auth_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final serviceInstance = Provider.of<IAuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () => serviceInstance.logOut(),
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('Home Page is here '),
      ),
    );
  }
}
