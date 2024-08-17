// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../screens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Assuming you have an image asset for the app bar title
        title: Image.asset('assets/images/appbar.png', fit: BoxFit.cover),
        leading: Image.asset('assets/images/logo.png'),
        backgroundColor:
            Colors.orange, // Match the background color in the screenshot
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              // mainAxisAlignment : MainAxisAlignment.spaceAround,
              width: double.infinity,
              height: 113,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.orange // Set your desired background color here
                      ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DescriptionPage(
                        khidma: 'كهربائي',
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'كهربائي',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset("assets/images/electric.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              height: 113,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.orange // Set your desired background color here
                      ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DescriptionPage(
                        khidma: 'تكيف وتبريد',
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'تكيف وتبريد',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                            "assets/images/electric.png"), //Replace it with the right image
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              height: 113,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.orange // Set your desired background color here
                      ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DescriptionPage(
                        khidma: 'تصليح كاميرات',
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'تصليح كاميرات',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                            "assets/images/zogag.png"), //Replace it with the right image
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              height: 113,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.orange // Set your desired background color here
                      ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DescriptionPage(
                        khidma: 'تصليح مصاعد',
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'تصليح مصاعد',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                            "assets/images/electric.png"), //Replace it with the right image
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              height: 113,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.orange // Set your desired background color here
                      ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DescriptionPage(
                        khidma: 'فلاتر',
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'فلاتر',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset("assets/images/tanzef.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              height: 113,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.orange // Set desired background color here
                      ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DescriptionPage(
                        khidma: 'محارة',
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'محارة',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                            "assets/images/zogag.png"), //Replace it with the right image
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              height: 113,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.orange // Set your desired background color here
                      ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DescriptionPage(
                        khidma: 'نجار',
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'نجار',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset("assets/images/nagar.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              height: 113,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.orange // Set your desired background color here
                      ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DescriptionPage(
                        khidma: 'نقاش',
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'نقاش',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                            "assets/images/electric.png"), //Replace it with the right image
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              height: 113,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.orange // Set your desired background color here
                      ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DescriptionPage(
                        khidma: 'سباك',
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'سباك',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset("assets/images/sabak.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              height: 113,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.orange // Set your desired background color here
                      ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DescriptionPage(
                        khidma: 'حداد',
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'حداد',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset("assets/images/hadad.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              height: 113,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.orange // Set your desired background color here
                      ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DescriptionPage(
                        khidma: 'تصليح دش وتليفيزيون',
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'تصليح دش وتليفيزيون',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                            "assets/images/electric.png"), //Replace it with the right image
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 88,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                foregroundDecoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                width: 80,
                height: 88,
                decoration: const BoxDecoration(color: Colors.orange),
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/homepage'),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.yellow),
                      Text("اضافة طلب"),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                foregroundDecoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                width: 80,
                height: 88,
                decoration: const BoxDecoration(color: Colors.orange),
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/orders'),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.history, color: Colors.yellow),
                      Text("طلباتي السابقة", textDirection: TextDirection.rtl),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                foregroundDecoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                width: 80,
                height: 88,
                decoration: const BoxDecoration(color: Colors.orange),
                child: TextButton(
                  onPressed: () {},
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.question_answer, color: Colors.yellow),
                      Text("المجتمع :عرض الاسئلة الشائعة",
                          textAlign: TextAlign.right),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                foregroundDecoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                width: 80,
                height: 88,
                decoration: const BoxDecoration(color: Colors.orange),
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/profile'),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.settings, color: Colors.yellow),
                      Text("الإعدادات"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
