import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_with_docs_and_my_value/builders/auth_state_builder.dart';
import 'package:flutter_app_with_docs_and_my_value/builders/page_selector.dart';
import 'package:flutter_app_with_docs_and_my_value/core/auth_service.dart';
import 'package:flutter_app_with_docs_and_my_value/core/i_auth_service.dart';
import 'package:flutter_app_with_docs_and_my_value/firebase_options.dart';
import 'package:flutter_app_with_docs_and_my_value/model/user.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IAuthService>(
          create: (_) => AuthService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthStateBuilder(
          onPageBuilder: (context, AsyncSnapshot<AppUser?> snapshot) {
            return PageSelector(snapshot: snapshot);
          },
        ),
      ),
    );
  }
}
