// import 'dart:html';

// import 'package:flutter/material.dart';


// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
// }

// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   final _emailController = TextEditingController();
//   final _codeController = TextEditingController();
//   final bool _codeSent = false;

//   Future<void> _requestResetCode() async {
//     final email = _emailController.text;
//     // API call to backend to send reset code to user's email
//     // Set state to show code input field on success
//   }

//   Future<void> _verifyCode() async {
//     final email = _emailController.text;
//     final code = _codeController.text;
//     // API call to backend to verify the code
//     // Navigate to password reset screen on success
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( backgroundColor: Colors.orangeAccent,
//       appBar: AppBar(title: const Text("Forgot Password")),
//       body:
//        Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             if (!_codeSent)
//               ElevatedButton(
//                 onPressed: _requestResetCode,
//                 child: const Text('Send Reset Code'),
//               ),
//             if (_codeSent) ...[
//               TextField(
//                 controller: _codeController,
//                 decoration: const InputDecoration(labelText: 'Enter Code'),
//               ),
//               ElevatedButton(
//                 onPressed: _verifyCode,
//                 child: const Text('Verify Code'),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
