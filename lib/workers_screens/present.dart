import 'package:flutter/material.dart';

class Present extends StatelessWidget {
  const Present({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 190, 61),
      appBar: AppBar(
        // Assuming you have an image asset for the app bar title
        title: Image.asset('assets/images/appbar.png', fit: BoxFit.cover),
        leading: Image.asset('assets/images/logo.png'),
        backgroundColor:
            Colors.orange, // Match the background color in the screenshot
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            Column(
              children: [
                PersonCard(
                  name: 'Mahmoud Badawy',
                  job: 'سباك',
                  subjob: 'تصليحات خفيفه',
                  address: 'Egypt,Luxor,Tod',
                ),
                PersonCard(
                  name: 'Mostafa Abdelraheem',
                  job: 'كهربائى',
                  subjob: 'تصليحات متوسطه',
                  address: 'Egypt, Qena',
                ),
                // Add more PersonCard instances here if needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  final String name;
  final String job;
  final String subjob;
  final String address;

  const PersonCard({
    super.key,
    required this.name,
    required this.job,
    required this.subjob,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 400,
        height: 170,
        decoration: BoxDecoration(
          border: Border.all(
            width: 4,
            color: const Color.fromARGB(255, 255, 146, 4),
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: const AlignmentDirectional(0, 0),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(width: 0.01),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      job,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: const AlignmentDirectional(0, 0),
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        border: Border.all(width: 0.01),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      subjob,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 0),
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        ":العنوان",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        address,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: const AlignmentDirectional(0, 0),
                    width: 140,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(width: 0.01),
                        borderRadius: BorderRadius.circular(50)),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/chat');
                      },
                      child: const Text(
                        "تقديم طلب تنفيذ",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
