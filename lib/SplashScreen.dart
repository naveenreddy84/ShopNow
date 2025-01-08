```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'auth/login_screen.dart';
import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
const SplashScreen({super.key});

@override
State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
void initState() {
super.initState();
_checkAuthStatus();
}

Future<void> _checkAuthStatus() async {
await Future.delayed(const Duration(seconds: 2)); // Show splash for 2 seconds
if (!mounted) return;

final authProvider = context.read<AuthProvider>();
if (authProvider.user != null) {
_navigateToHome();
} else {
_navigateToLogin();
}
}

void _navigateToHome() {
Navigator.pushReplacement(
context,
MaterialPageRoute(builder: (context) => const HomeScreen()),
);
}

void _navigateToLogin() {
Navigator.pushReplacement(
context,
MaterialPageRoute(builder: (context) => const LoginScreen()),
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
body: Container(
width: double.infinity,
height: double.infinity,
decoration: const BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
colors: [Colors.blue, Colors.lightBlue],
),
),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
// App Logo
Icon(
Icons.shopping_bag,
size: 80,
color: Colors.white,
),
const SizedBox(height: 24),
// App Name
const Text(
'E-Commerce Store',
style: TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
const SizedBox(height: 24),
// Loading indicator
const CircularProgressIndicator(
valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
),
],
),
),
);
}
}