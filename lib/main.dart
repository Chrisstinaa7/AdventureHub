import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adventurehub/screens/splash_screen.dart';
import 'package:adventurehub/screens/homescreen.dart';
import 'package:adventurehub/screens/About.dart';
import 'package:adventurehub/screens/auth/loginscreen.dart';

import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //bindings with native platform have been created properly
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAiloVlQ_tjfoFKjA9goFCsUP-YOawiP7w",
            authDomain: "fir-e475e.firebaseapp.com",
            projectId: "fir-e475e",
            storageBucket: "fir-e475e.appspot.com",
            messagingSenderId: "369832788571",
            appId: "1:369832788571:web:1167f50f274f6c792e757e"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const AdventureHub());
}

class AdventureHub extends StatelessWidget {
  const AdventureHub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
