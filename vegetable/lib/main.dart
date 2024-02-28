import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegetable/constant/colors.dart';
import 'package:vegetable/presentation/farmer/farmerauthservice.dart';
import 'package:vegetable/presentation/home/vegetablelisting.dart';
import 'package:vegetable/presentation/main_page/onboardingpage/onbaording_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    
  
    ),
    
    
    
    ChangeNotifierProvider(create: (context) => CartModel())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
    authService.fetchAllProducts(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldbackgroundcolor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Onboardingscreen(),
    );
  }
}
