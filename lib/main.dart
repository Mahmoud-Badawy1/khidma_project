import 'package:flutter/material.dart';
import 'screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DatabaseProvider>(
          create: (context) =>
              DatabaseProvider(), // Instance of DatabaseProvider
          dispose: (context, value) =>
              value.close(), // Optionally handle disposal
        ),
        ChangeNotifierProxyProvider<DatabaseProvider, UserProvider>(
          create: (context) => UserProvider(context.read<DatabaseProvider>()),
          update: (context, dbProvider, currentUserProvider) =>
              currentUserProvider ?? UserProvider(dbProvider),
        ),
        // Add any other necessary providers here
      ],
      child: MaterialApp(
        title: 'Your App Title',
        theme: ThemeData(
          // Define your app theme here
          primarySwatch: Colors.blue,
        ),
        home: SignUpPage(), // Your initial screen
        routes: {
          '/login': (context) =>
              const LoginPage(), // Ensure LoginPage is defined in your screens
          '/signup': (context) =>
              SignUpPage(), // Ensure SignUpPage is defined in your screens
              // '/forgotPassword': (context) => const ForgotPasswordScreen(),
              '/discribtion':(context) => const DescriptionPage(),
          '/orders': (context)  => 
              const OrdersPage(order: null,),
          '/homepage':(context) => const HomePage(),    
           '/profile':(context) => const ProfilePage(),    
          // Define other routes as necessary
        },
      ),
    );
  }
}
