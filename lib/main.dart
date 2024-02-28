import 'package:flutter/material.dart';
import 'package:khidma_app/workers_screens/worker_login.dart';
import 'package:provider/provider.dart';

import 'screens.dart';

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
        home: const FirstPage(), // Your initial screen
        routes: {
          '/login': (context) =>
              const LoginPage(), // Ensure LoginPage is defined in your screens
          '/signup': (context) =>
              const SignUpPage(), // Ensure SignUpPage is defined in your screens
              '/workersignup': (context) =>
              const WorkerSignUpPage(),
              '/workerlogin': (context) =>
              const WorkerLoginPage(),
              '/present': (context) =>
              const Present(),
              '/chat': (context) =>
              const Chat(),
              '/workerhome':(context) =>  const WorkerHomePage(),
          // '/forgotPassword': (context) => const ForgotPasswordScreen(),
          '/discribtionelc': (context) => const DescriptionPage(),
          '/discribtionac': (context) => const DescriptionPageac(),
          '/discribtioncam': (context) => const DescriptionPagecam(),
          '/discribtionelev': (context) => const DescriptionPageelev(),
          '/discribtionfillter': (context) => const DescriptionPagefil(),
          '/discribtionmah': (context) => const DescriptionPagemah(),
          '/discribtionnagar': (context) => const DescriptionPagenagar(),
          '/discribtionnagash': (context) => const DescriptionPagenagash(),
          '/discribtionsabak': (context) => const DescriptionPagesab(),
          '/discribtionsteel': (context) => const DescriptionPagest(),
          '/discribtiontv': (context) => const DescriptionPagetv(),
          '/orders': (context) => const OrdersPage(
                order: null,
              ),
          '/homepage': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/orderdetails':(context) => const OrderDetailScreen(order: null),
          '/firstpage':(context) => const FirstPage(),
          // Define other routes as necessary
        },
      ),
    );
  }
}
