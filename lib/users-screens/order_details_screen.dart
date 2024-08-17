import 'package:flutter/material.dart';
import '../screens.dart';

class OrderDetailScreen extends StatelessWidget {
  final Order? order;

  const OrderDetailScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Image.asset('assets/images/appbar.png', fit: BoxFit.cover),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name: ${order!.name}', style: const TextStyle(fontSize: 20)),
            Text('Date: ${order!.date}', style: const TextStyle(fontSize: 20)),
            Text('Description: ${order!.description}',
                style: const TextStyle(fontSize: 20)),
            Text('Status: ${order!.status}',
                style: const TextStyle(fontSize: 20)),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
