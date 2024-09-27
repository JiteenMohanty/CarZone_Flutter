import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:carzone/LoginPage/login.dart';
import 'package:carzone/CarDetailsForm/cardetails.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:carzone/firebase_options.dart'; // Import the Firebase options

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Initialize Firebase with options
  );
  runApp(
    MaterialApp(
      title: 'CarZone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/CarDetailsForm': (context) => const CarDetailsForm(),
        '/LoginPage': (context) => LoginPage(setUser: (user) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/CarDetailsForm', (route) => false);
            }),
      },
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/CarDetailsForm');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.deepPurple,
          size: 50.0,
        ),
      ),
    );
  }
}
