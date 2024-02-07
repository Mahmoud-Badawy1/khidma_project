import 'package:flutter/material.dart';
class FirstPage extends StatefulWidget {
  static String selectedUserType = 'normal'; // Default user type

  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String selectedUserType = FirstPage.selectedUserType; // Default user type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.orange[300], // Set your desired background color
        child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Stack(
            // Stack for overlaying the image above the buttons
            alignment: Alignment.center,
            children: [
              Column(
                // Column for vertical button layout
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedUserType = 'normal';
                      });
                      Navigator.pushNamed(context, '/signup');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 50), // Set width and height
                      foregroundColor: Colors.white,
                      backgroundColor:
                          const Color.fromARGB(255, 0, 0, 0), // Default Orange Color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    child: const Text('عميل',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26), ),
                  ),
                  const SizedBox(height: 20), // Spacer between buttons
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedUserType = 'worker';
                      });
                      Navigator.pushNamed(context, '/workerhome');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 50), // Set width and height
                      foregroundColor: Colors.white,
                      backgroundColor:
                          const Color.fromARGB(255, 0, 0, 0), // Orange Color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                    child: const Text('صنايعي',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),
                  ),
                ],
              ),
              Positioned(
                top: 80,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 800,
                      height: 150,
                      child: Image.asset(
                          'assets/images/logo.png'), // Replace with your logo asset path
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
