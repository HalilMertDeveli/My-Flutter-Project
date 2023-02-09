import 'package:flutter/material.dart';
import 'package:flutter_app_with_docs_and_my_value/old_firebase_folders/core/i_auth_service.dart';
import 'package:flutter_app_with_docs_and_my_value/old_firebase_folders/model/user.dart';
import 'package:provider/provider.dart';

class AuthStateBuilder extends StatelessWidget {
  const AuthStateBuilder({super.key, required this.onPageBuilder});

  final Widget Function(BuildContext context, AsyncSnapshot<AppUser?> snapshot)
      onPageBuilder;

  @override
  Widget build(BuildContext context) {
    final serviceInstance = Provider.of<IAuthService>(context, listen: false);

    return StreamBuilder(
      builder: (context, snapshot) {
        final userData = snapshot.data;
        if (userData != null) {
          return MultiProvider(
            providers: [
              Provider.value(
                value: userData,
              ),
            ],
            child: onPageBuilder(context, snapshot),
          );
        }

        return onPageBuilder(context, snapshot);
      },
      stream: serviceInstance.authStateChange,
    );
  }
}
