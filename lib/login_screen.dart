// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;



  void _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final user = await userProvider.login(email, password);

      if (user != null) {
        if (user['user_type'] == 'worker') {
          Navigator.pushReplacementNamed(context, '/workerHomePage');
        } else {
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Login failed'), backgroundColor: Colors.red),
        );
      }
    }
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4), // Light Grey Background
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
                    ClipPath(
  clipper: BottomCurveClipper(),
  child: Container(
    height: 300, // Adjust the height as needed
    decoration: const BoxDecoration(
      color: Colors.orange, // Your container's color
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(66),
        bottomRight: Radius.circular(66),
      ),
      boxShadow: [
        BoxShadow(
          color: Color(0x40000000), // Shadow color with transparency
          blurRadius: 4, // Blur radius for the shadow
          spreadRadius: 0, // Spread radius
          offset: Offset(0, 4), // Vertical offset for the shadow
        ),
      ],
    ),
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
  
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
        children: <Widget>[
          // Place your logo image inside this Column
          Image.asset(
            'assets/images/logo2.png', // Replace with your actual logo asset
            width: MediaQuery.of(context).size.width * 1, // Set the width to 50% of the screen width
            height: 120, // Adjust the height as needed
          ),
        ],
      ),
    ),
  ),
),

               const SizedBox(height: 20), // Adjust spacing as needed
                      const SizedBox(height: 4),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'البريد الالكتروني',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                          
                        ),
                        // Add other decoration properties
                      ),
                    validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                    ),
                    const SizedBox(height: 15), // Adjust spacing as needed
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'كلمة السر',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        // Add other decoration properties
                      ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                    ),
                    const SizedBox(height: 20,),
                    
                    Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton( 
onPressed: () => Navigator.pushNamed(context, '/forgotPassword'), // Assuming '/forgotPassword' is the route to your forgot password screen
  child: const Text(
    'نسيت كلمة السر؟',
    style: TextStyle(
      color: Color.fromARGB(255, 1, 149, 255), // Text color
    ),
  ),
),
                      const SizedBox(width: 193,),
                       Checkbox(
                          value: _rememberMe,
                          onChanged: (bool? value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                        ),
                        const Text('تذكرنى', style: TextStyle(
      color: Color.fromARGB(255, 1, 149, 255), // Text color
    ),),
                  ],),
const SizedBox(height: 20), // Space between buttons

                    const SizedBox(height: 30), // Adjust spacing as needed
                    ElevatedButton(
                      onPressed: () => _login(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Background color
                        shape: const StadiumBorder(),
                        // Add other style properties
                      ),
                      child: const Text('تسجيل الدخول'),
                    ),
                    TextButton(
                       onPressed: () {
                    Navigator.pushNamed(
                        context, '/signup'); // Navigate to signup screen
                  },
                      child: const Text('انشاء حساب جديد'),
                      // Add other style properties
                    ),
                    const SizedBox(height: 20), // Space between buttons

                    // Add other buttons and widgets
                  ],
                ),
              ),
            ),
          
    );
  }
}



class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double curveDepth = 0; // The depth of the curve
    double curveControlHeight = size.height - curveDepth;

    Path path = Path();
    path.lineTo(0, size.height - curveDepth); // Line to the start of the curve on the left

    // The control points for the Bézier curve are slightly above the bottom of the container
    // Adjust the control point offset multiplier to fine-tune the curve
    Offset controlPoint1 = Offset(size.width * 0.25, curveControlHeight);
    Offset endPoint1 = Offset(size.width * 0.5, size.height - curveDepth / 2);
    path.quadraticBezierTo(
      controlPoint1.dx, controlPoint1.dy,
      endPoint1.dx, endPoint1.dy,
    );

    Offset controlPoint2 = Offset(size.width * 0.75, curveControlHeight);
    Offset endPoint2 = Offset(size.width, size.height - curveDepth);
    path.quadraticBezierTo(
      controlPoint2.dx, controlPoint2.dy,
      endPoint2.dx, endPoint2.dy,
    );

    path.lineTo(size.width, 0); // Line to the top right corner
    path.close(); // Close the path with a line to the top left corner

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}





