import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_with_docs_and_my_value/builders/auth_state_builder.dart';
import 'package:flutter_app_with_docs_and_my_value/builders/page_selector.dart';
import 'package:flutter_app_with_docs_and_my_value/core/auth_service.dart';
import 'package:flutter_app_with_docs_and_my_value/core/i_auth_service.dart';
import 'package:flutter_app_with_docs_and_my_value/firebase_options.dart';
import 'package:flutter_app_with_docs_and_my_value/model/user.dart';
import 'package:flutter_app_with_docs_and_my_value/pages/designScreens/splashScreen/splash_body.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ForAuthDesing());
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

/*
  Takip ettiğin Youtube uygulamasında ki tasarımı al , yazdıgın firebase ile birleştir
  aldıgın bu değerleri metotlara ilet ve giriş sistemini tamamla 

  algoritma:
    1-)Youtube 'daki giriş sistemini buraya entegre et 
      1-a) Kaydırlamı ekranını kele
        1-a-1)3 Tane kaydırmalı ekran için resim bul (bunu kodlama bittikten sonra Ill zamanında yap)
      2-a)giriş Sayfasını entegre et 
    2-) veriler form kullanarak al ve bu iki yapıyı biribiri ile bağla 
      2-a) Bunu yaparken git kullan ve bildmediğin yerde googla ve o problemi nasıl çözecegini araştır
           problemi çözdikkten sonra diğer probleme ilerle ,adım-adım 



 */

class ForAuthDesing extends StatefulWidget {
  ForAuthDesing({super.key});

  @override
  State<ForAuthDesing> createState() => _ForAuthDesingState();
}

class _ForAuthDesingState extends State<ForAuthDesing> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashBody());
  }
}
