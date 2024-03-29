import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'workers_screens.dart';

// ignore: must_be_immutable
class WorkerSignUpPage extends StatefulWidget {
  const WorkerSignUpPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WorkerSignUpPageState createState() => _WorkerSignUpPageState();
}

class _WorkerSignUpPageState extends State<WorkerSignUpPage> {
  final _formKey = GlobalKey<FormState>(); // Signup form key
  // TextEditingControllers to retrieve the current value of TextFormFields
  final _userNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _IDController = TextEditingController();

  String userType = FirstPage.selectedUserType; // Default user type

  void _handleSignUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final String userName = _userNameController.text;
      final String phoneNumber = _phoneNumberController.text;
      final String email = _emailController.text;
      final String password = _passwordController.text;
      final int ID = _IDController.text as int;


      final bool success =
          await Provider.of<UserProvider>(context, listen: false)
              .signUp(userName, phoneNumber, email, password, userType, ID);

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
                color:  Colors.orange, // Yellow Color for the top part
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
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        30.0), // Adjust the radius as needed
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: _userNameController,
                      decoration: InputDecoration(
                        labelText: 'الاسم بالكامل',
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك ادخل اسمك';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        30.0), // Adjust the radius as needed
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: TextFormField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      labelText: 'رقم الهاتف',
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'رجاءً ادخل رقم الهاتف الخاص بك';
                      }
                      return null;
                    },
                  ),
                ),
              ),
                Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        30.0), // Adjust the radius as needed
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: TextFormField(
                    controller: _IDController,
                    decoration: InputDecoration(
                      labelText: 'الرقم القومى',
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'رجاءً ادخل الرقم القومى';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        30.0), // Adjust the radius as needed
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'البريد الالكترونى',
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return 'من فضلك ادخل اميل صحيح';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        30.0), // Adjust the radius as needed
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'كلمة المرور',
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'رجاءً ادخل كلمة المرور';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              // DropdownButton<String>(
              //   value: selectedStudent,
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       selectedStudent = newValue!;
              //     });
              //   },
              //   items: <String>['a','b','c']
              //   //'تكيف وتبريد', 'كهربائي', 'تصليح كاميرات'  'تصليح مصاعد','فلاتر','محارة','نجار','نقاش','سباك','حداد','تصليح دش وتليفيزيون'
              //       .map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),

              const SizedBox(height: 12),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
                child: ElevatedButton(
                  onPressed: () => _handleSignUp(context),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        Colors.orange, // Text Color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    minimumSize: const Size(
                        double.infinity, 36), // full width and 36 height
                  ),
                  child: const Text(
                    'تسجيل حساب جديد',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/workerlogin'),
                child: const Text('لدى حساب بالفعل'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
