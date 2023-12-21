import 'package:flutter/material.dart';
import 'screens.dart';

// class OrderWidget extends StatelessWidget {
//   final Order order;

//   const OrderWidget({super.key, required this.order});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: order.status == 'completed' ? const Color.fromARGB(255, 33, 62, 110) :
//              order.status == 'incomplete' ? Colors.green :
//              Colors.red,
//       child: ListTile(
//         title: Text(order.name),
//         subtitle: Text('Date: ${order.date}\nDescription: ${order.description}'),
//         trailing: IconButton(
//           icon: const Icon(Icons.arrow_forward),
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => OrderDetailScreen(order: order),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


class OrdersPage extends StatelessWidget {
  final Order? order;

  const OrdersPage({super.key, required this.order});
 
  @override
  Widget build(BuildContext context) {
     // Check if the order is null and display a message if so
    if (order == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text('Orders'),
        ),
        body: const Center(
          child: Text('No orders yet', style: TextStyle(fontSize: 24)),
        ),
      );
    }
 else {    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
 body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
    Card(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
          color: _getStatusColor(order!.status),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          leading: _getStatusIcon(order!.status),
          title: Text(order!.name, style: const TextStyle(color: Colors.white)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('التاريخ: ${order!.date}', style: const TextStyle(color: Colors.white)),
              Text('وصف الخدمة: ${order!.description}', style: const TextStyle(color: Colors.white)),
              Text('رقم العميل: ${order!.customerPhone}', style: const TextStyle(color: Colors.white)),
            ],
          ),
          trailing: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>  OrderDetailScreen(order: order),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber, // Background color
            ),
            child: const Text('عرض المزيد', style: TextStyle(color: Colors.black)),
        ),
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
    const SizedBox(width: 2),
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
    const SizedBox(width: 2),
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
    const SizedBox(width: 2),
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
    const SizedBox(width: 2),
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
          )
    );
  }

  }
  Color _getStatusColor(String status) {
    switch (status) {
      case 'completed':
        return Colors.blue;
      case 'incomplete':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Widget _getStatusIcon(String status) {
    IconData iconData;
    Color color;

    switch (status) {
      case 'completed':
        iconData = Icons.check_circle_outline;
        color = Colors.white;
        break;
      case 'incomplete':
        iconData = Icons.access_time_outlined;
        color = Colors.white;
        break;
      case 'cancelled':
        iconData = Icons.cancel_outlined;
        color = Colors.white;
        break;
      default:
        iconData = Icons.help_outline;
        color = Colors.white;
    }

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2), // Lighter shade of the icon
        shape: BoxShape.circle,
      ),
      child: Icon(iconData, color: color, size: 32.0),
    );
  }

}
class Order {
  final int id;
  final String name;
  final String date; // Assuming date is a string. You could also use DateTime and format it accordingly.
  final String description;
  final String? customerPhone;
  final String status; // 'completed', 'incomplete', 'cancelled'

  Order({
    required this.id,
    required this.name,
    required this.date,
    required this.description,
    required this.customerPhone,
    required this.status,
  });
// Implementing the copyWith method
  Order copyWith({
    int? id,
    String? name,
    String? date,
    String? description,
    String? customerPhone,
    String? status,
  }) {
    return Order(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      description: description ?? this.description,
      customerPhone: customerPhone ?? this.customerPhone,
      status: status ?? this.status,
    );
  }
  // Convert a Order object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'description': description,
      'customerPhone': customerPhone,
      'status': status,
    };
  }

  // Extract a Order object from a Map object
  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'],
      name: map['name'],
      date: map['date'],
      description: map['description'],
      customerPhone: map['customerPhone'],
      status: map['status'],
    );
  }
}

