import 'package:flutter/material.dart';

class SubmitPage extends StatelessWidget {
  const SubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
       appBar: AppBar(
        // Assuming you have an image asset for the app bar title
        title: Image.asset('assets/images/appbar.png', fit: BoxFit.cover),
        leading: Image.asset('assets/images/logo.png'),
        backgroundColor:
            Colors.orange, // Match the background color in the screenshot
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildActionContainer(
                text:
                    'يمكنك الان التواصل مع العميل من خلال رقم الهاتف وتذكر تحديد موعد التصليح',
                icon: Icons.phone,
                color: Colors.orange,
              ),
              _buildActionContainer(
                text: 'عرض الكود الخاص بك',
                icon: Icons.qr_code_scanner,
                color: Colors.deepOrange,
              ),
              _buildActionContainer(
                text: 'تواصل معنا',
                icon: Icons.headset_mic,
                color: Colors.orange,
              ),
              _buildActionContainer(
                text: 'تقييم التطبيق',
                icon: Icons.thumb_up,
                color: Colors.deepOrange,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, bottom: 16.0, left: 8.0, right: 8.0),
                child: SizedBox(
                  width: double
                      .infinity, // Set your desired width here. double.infinity will make it as wide as the parent allows.
                  height: 70,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30.0), // Rounded corners for the button
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/present');
                    },
                    child: const Text('العوده للصفحه الرئيسيه', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionContainer(
      {required String text, required IconData icon, required Color color}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 24.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: Colors.white),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
