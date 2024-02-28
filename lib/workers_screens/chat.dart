import 'package:flutter/material.dart';
import 'package:khidma_app/description/descriptions.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<String> messages = [];
  final TextEditingController messageController = TextEditingController();

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      setState(() {
        messages.add(messageController.text);
        messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                alignment: const AlignmentDirectional(0, 0),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80),
                                  color: Colors.green,
                                ),
                                child: Center(
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.phone,
                                      size: 37,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  "محمودحسين",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  "01022643569",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            SizedBox(
                              // Logo
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                'assets/images/logo.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                border: Border.all(width: 0.01),
                                borderRadius: BorderRadius.circular(50)),
                            alignment: Alignment.center,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SubmitPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "تم الاتفاق",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                             top: 4.0,
                             bottom: 4.0,
                             left: 5.0,
                             right: 5.0,
                                  ),
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                border: Border.all(width: 0.01),
                                borderRadius: BorderRadius.circular(50)),
                            alignment: Alignment.center,
                            child: const Text(
                              "صيانات متوسطه",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                border: Border.all(width: 0.01),
                                borderRadius: BorderRadius.circular(50)),
                            alignment: Alignment.center,
                            child: const Text(
                              "كهربائى",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 1,
                            width: double.infinity,
                            decoration:
                                const BoxDecoration(color: Colors.black)),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.orange[
                        50], // Choose the color you like for the message background
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    messages[index],
                    style: const TextStyle(
                      color: Colors
                          .black87, // Choose the text color that suits the background
                      // Add other styling properties if needed
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 1,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.black)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: 'اكتب رسالتك هنا...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.send, color: Colors.orange),
                onPressed: sendMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
