import 'package:flutter/material.dart';
import 'screens.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>(); // Signup form key

  // TextEditingControllers to retrieve the current value of TextFormFields
  final _userNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _selectedUserType = 'normal'; // Default user type

  SignUpPage({Key? key}) : super(key: key);

  void _handleSignUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final String userName = _userNameController.text;
      final String phoneNumber = _phoneNumberController.text;
      final String email = _emailController.text;
      final String password = _passwordController.text;

      final bool success =
          await Provider.of<UserProvider>(context, listen: false).signUp(
              userName, phoneNumber, email, password, _selectedUserType);

      if (success) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Sign up failed'), backgroundColor: Colors.red),
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
              Container(
                color: const Color(0xFFFFC107), // Yellow Color for the top part
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                height: 150,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 4),
                      SizedBox(
                        width: 700,
                        height: 100,
                        child: Image.asset(
                            'assets/images/logo2.png'), // Replace with your logo asset path
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ),
              // Row for horizontal button layout
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                          onPressed: () => _selectedUserType = 'normal',
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color(0xFFFF9800), // Orange Color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          child: const Text('عميل'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                          onPressed: () => _selectedUserType = 'worker',
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color(0xFFFF9800), // Orange Color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          child: const Text('مقدم خدمة'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: _userNameController,
                decoration: const InputDecoration(labelText: 'الاسم بالكامل'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'من فضلك ادخل اسمك';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),
              TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(labelText: 'رقم الهاتف'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'رجاءً ادخل رقم الهاتف الخاص بك';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration:
                    const InputDecoration(labelText: 'البريد الالكترونى'),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'من فضلك ادخل اميل صحيح';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'كلمة المرور'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'رجاءًادخل كلمة المرور ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => _handleSignUp(context),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFFF21D2F), // Text Color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  minimumSize: const Size(
                      double.infinity, 36), // full width and 36 height
                ),
                child: const Text('تسجيل حساب جديد'),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: const Text('لدى حساب بالفعل'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
