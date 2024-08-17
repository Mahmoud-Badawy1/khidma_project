import 'package:flutter/material.dart';
import 'dart:async';
import '../screens.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<String?> userNameFuture;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    userNameFuture = getUserName('userId');
    // Ensure the widget rebuilds after loading the user data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Image.asset('assets/images/appbar.png', fit: BoxFit.cover),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 60,
            backgroundImage: AssetImage('assets/images/logo.png'),
          ),
          const SizedBox(height: 20),
          FutureBuilder<String?>(
            future: userNameFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Display a loading indicator while waiting for the result
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // Handle error case
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                // Display the username if available
                return Text(
                  snapshot.data!,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                );
              } else {
                // Display a fallback if no data is available
                return const Text('Username not found');
              }
            },
          ),
          const SizedBox(height: 20),
          buildProfileOption('طلباتي السابقة', Icons.history),
          buildProfileOption('الملف الشخصي', Icons.person),
          buildProfileOption('تغيير كلمة المرور', Icons.lock),
          buildProfileOption(
              'تغيير نوع الحساب', Icons.arrow_circle_right_rounded),
          const Spacer(),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.red,
              ),
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: const Text('Log Out'),
            ),
          ),
        ],
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

  ListTile buildProfileOption(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        switch (title) {
          case 'طلباتي السابقة':
            // Handle navigation for this item
            Navigator.pushNamed(context, '/orders');
            break;
          case 'الملف الشخصي':
            // Handle navigation for this item
            Navigator.pushNamed(context, '/profile');
            break;
          case 'تغيير كلمة المرور':
            // Handle navigation for this item
            Navigator.pushNamed(context, '/change_password');
            break;
          case 'تغيير نوع الحساب':
            // Handle navigation for this item
            Navigator.pushNamed(context, '/change_account_type');
            break;
          // Add more cases for each item in your list
          default:
            break;
        }
      },
    );
  }

  Future<String?> getUserName(String userId) async {
    final dbProvider = DatabaseProvider(); // Create an instance
    final dbClient =
        await dbProvider.database; // Access database through the instance

    List<Map> result = await dbClient.query(
      DatabaseProvider.TABLE_USERS,
      columns: ['user_name'],
      where: 'id = ?',
      whereArgs: [userId],
    );

    if (result.isNotEmpty) {
      return result.first['user_name'] as String;
    }
    return null;
  }
}

// body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // const SizedBox(height: 0),
//             const CircleAvatar(
//               radius: 60,
//               backgroundImage: AssetImage('assets/images/logo.png'),
//             ),
//             // const SizedBox(height: 0),
//             const Text(
//               // ignore: unnecessary_string_interpolations
//               'mahmoud',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             // const SizedBox(height: 0),
//             buildProfileOption('طلباتي السابقة', Icons.history),
//             buildProfileOption('الملف الشخصي', Icons.person),
//             buildProfileOption('تغيير كلمة المرور', Icons.lock),
//             buildProfileOption(
//                 'تغيير نوع الحساب', Icons.arrow_circle_right_rounded),
//             const Spacer(),
//             Expanded(
//         child: Container(
//               width: double.infinity,
//               margin: const EdgeInsets.all(16),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   backgroundColor: Colors.green,
//                 ),
//                 onPressed: () => Navigator.pushNamed(context, '/signup'),
//                 child: const Text('Log Out'),
//               ),
//             ),
          
//         ),
//     ],  ),
    
//   ),
  // ListTile buildProfileOption(String title, IconData icon) {
  //   return ListTile(
  //     leading: Icon(icon, color: Colors.grey),
  //     title: Text(title),
  //     trailing:
  //         const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
  //     onTap: () {},
  //   );
  // }