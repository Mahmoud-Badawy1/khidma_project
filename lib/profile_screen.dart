import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Image.asset('assets/images/appbar.png', fit: BoxFit.cover),
      ),
      body: SingleChildScrollView(
         child: Column(
        children: [
          const SizedBox(height: 40),
           const CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1568602471122-7832951cc4c5'),
          ),
          
          const SizedBox(height: 20),
          const Text(
            'Jane Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          buildProfileOption('طلباتي السابقة', Icons.history),
          buildProfileOption('الملف الشخصي', Icons.person),
          buildProfileOption('تغيير كلمة المرور', Icons.lock),
          buildProfileOption('تغيير نوع الحساب', Icons.arrow_circle_right_rounded),
          const Spacer(),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16), backgroundColor: Colors.green,
              ),
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: const Text('Log Out'),
            ),
          ),
          const SizedBox(height: 30),
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
        width: 80,
        height: 88,
        decoration: const BoxDecoration(color: Colors.orange),
        child: TextButton(
         onPressed: () => Navigator.pushNamed(
                        context, '/homepage'),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add, color: Colors.yellow),
              Text("اضافة طلب"),
            ],
          ),
        ),
      ),
    ),
    Expanded(
      child: Container(
        width: 80,
        height: 88,
        decoration: const BoxDecoration(color: Colors.orange),
        child: TextButton(
          onPressed: () => Navigator.pushNamed(
                        context, '/orders'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.history, color: Colors.yellow),
              Text("طلباتي السابقة", textDirection: TextDirection.rtl),
            ],
          ),
        ),
      ),
    ),
    Expanded(
      child: Container(
        width: 80,
        height: 88,
        decoration: const BoxDecoration(color: Colors.orange),
        child: TextButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.question_answer, color: Colors.yellow),
              Text("المجتمع :عرض الاسئلة الشائعة", textAlign: TextAlign.right),
            ],
          ),
        ),
      ),
    ),
    Expanded(
      child: Container(
        width: 80,
        height: 88,
        decoration: const BoxDecoration(color: Colors.orange),
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, '/profile'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
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
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}
