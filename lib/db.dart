// ignore_for_file: constant_identifier_names, depend_on_referenced_packages
import 'package:flutter/foundation.dart';

import 'screens.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static const String TABLE_USERS = 'users'; // Example table name
  static const String COLUMN_USER_ID = 'id';
  static const String COLUMN_USER_USER_NAME = 'user_name';
  static const String COLUMN_USER_PHONE_NUMBER = 'phone_number';
  static const String COLUMN_USER_EMAIL = 'email';
  static const String COLUMN_USER_PASSWORD = 'password';
  static const String COLUMN_USER_TYPE =
      'user_type'; // Column to distinguish user types

  // Define additional tables and columns
  static const String TABLE_WORKERS = 'workers';
  static const String COLUMN_WORKER_ID = 'id';
  static const String COLUMN_WORKER_NAME = 'name';
  static const String COLUMN_WORKER_EMAIL = 'email';
  static const String COLUMN_WORKER_PHONE_NUMBER = 'phone_number';

  static const String TABLE_ORDERS = 'orders';
  static const String COLUMN_ORDER_ID = 'id';
  static const String COLUMN_ORDER_NAME = 'name';
  static const String COLUMN_ORDER_DATE = 'date';
  static const String COLUMN_ORDER_DESCRIPTION = 'description';
  static const String COLUMN_ORDER_CUSTOMER_PHONE = 'customerPhone';
  static const String COLUMN_ORDER_STATUS = 'status';


  static const String _databaseName = "your_database.db"; // Your database name
  static const int _databaseVersion = 1;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (Database db, int version) async {
        // Create users table
        await db.execute("""
          CREATE TABLE $TABLE_USERS (
            $COLUMN_USER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $COLUMN_USER_USER_NAME TEXT,
            $COLUMN_USER_PHONE_NUMBER TEXT,
            $COLUMN_USER_EMAIL TEXT UNIQUE,
            $COLUMN_USER_PASSWORD TEXT,
            $COLUMN_USER_TYPE TEXT
          );
        """);

        // Create workers table
        await db.execute("""
          CREATE TABLE $TABLE_WORKERS (
            $COLUMN_WORKER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            $COLUMN_WORKER_NAME TEXT,
            $COLUMN_WORKER_EMAIL TEXT UNIQUE,
            $COLUMN_WORKER_PHONE_NUMBER TEXT
          );
        """);

        // Create orders table
    await db.execute('''
      CREATE TABLE $TABLE_ORDERS (
        $COLUMN_ORDER_ID INTEGER PRIMARY KEY,
        $COLUMN_ORDER_NAME TEXT,
        $COLUMN_ORDER_DATE TEXT,
        $COLUMN_ORDER_DESCRIPTION TEXT,
        $COLUMN_ORDER_CUSTOMER_PHONE TEXT,
        $COLUMN_ORDER_STATUS TEXT
      )
    ''');
      },
    );
  }

  Future<void> insertUser(Map<String, dynamic> userData) async {
    final db = await database;
    await db.insert(TABLE_USERS, userData);
  }

  Future<Map<String, dynamic>?> getUserByEmailAndPassword(
      String email, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      TABLE_USERS,
      where: "$COLUMN_USER_EMAIL = ? AND $COLUMN_USER_PASSWORD = ?",
      whereArgs: [email, password],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }
  // Method to handle user login
  Future<bool> loginUser(String email, String password) async {
    final dbClient = await database;
    List<Map> result = await dbClient.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    return result.isNotEmpty;
  }
   Future<bool> registerUser(String email, String password) async {
    final dbClient = await database;
    try {
      // Inserting a new user into the users table
      await dbClient.insert(
        'users', // Assuming 'users' is your table name
        {
          'email': email,
          'password': password, // In a real app, make sure to securely hash the password
        },
      );
      return true; // Registration successful
    } catch (e) {
      // Handle exceptions or duplicate entries
      if (kDebugMode) {
        print('Registration failed: $e');
      }
      return false; // Registration failed
    }
  }
   // Function to get a user's phone number from the database
  Future<String?> getUserPhoneNumber(String userId) async {
    final dbClient = await database;
    List<Map> result = await dbClient.query(
      TABLE_USERS, // your users table name
      columns: ['phone_number'], // the column you want to retrieve
      where: 'id = ?', // replace 'id' with your user identifier column if different
      whereArgs: [userId],
    );

    if (result.isNotEmpty) {
      return result.first['phone_number'] as String;
    }
    return null; // Return null if the user is not found
  }
 Future<void> updateUser(int id, Map<String, dynamic> updatedData) async {
    final db = await database;
    await db.update(
      TABLE_USERS,
      updatedData,
      where: '$COLUMN_USER_ID = ?',
      whereArgs: [id],
    );
  }

  // Method to delete a user
  Future<void> deleteUser(int id) async {
    final db = await database;
    await db.delete(
      TABLE_USERS,
      where: '$COLUMN_USER_ID = ?',
      whereArgs: [id],
    );
  }
 

  Future<void> insertWorker(Map<String, dynamic> workerData) async {
    final db = await database;
    await db.insert(TABLE_WORKERS, workerData);
  }

  Future<Map<String, dynamic>?> getWorkerById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      TABLE_WORKERS,
      where: "$COLUMN_WORKER_ID = ?",
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> getAllworkers() async {
    final db = await database;
    return await db.query(TABLE_WORKERS);
  }

 // Method to update a worker
  Future<void> updateWorker(int id, Map<String, dynamic> updatedData) async {
    final db = await database;
    await db.update(
      TABLE_WORKERS,
      updatedData,
      where: '$COLUMN_WORKER_ID = ?',
      whereArgs: [id],
    );
  }
Future<int> insertOrder(Order order) async {
  final dbClient = await database;
  int result = await dbClient.insert(
    TABLE_ORDERS, // Assuming TABLE_ORDERS is defined as your orders table name
    order.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace, // Optional: to handle the case where the same order is inserted twice
  );
  return result;
}

Future<List<Order>> getOrders() async {
  final dbClient = await database;
  final List<Map<String, dynamic>> maps = await dbClient.query(TABLE_ORDERS);

  // Convert the List<Map<String, dynamic>> into a List<Order>.
  return List.generate(maps.length, (i) {
    return Order(
      id: maps[i][COLUMN_ORDER_ID],
      name: maps[i][COLUMN_ORDER_NAME],
      date: maps[i][COLUMN_ORDER_DATE],
      description: maps[i][COLUMN_ORDER_DESCRIPTION],
      customerPhone: maps[i][COLUMN_ORDER_CUSTOMER_PHONE],
      status: maps[i][COLUMN_ORDER_STATUS],
    );
  });
}


  // Method to update an order
 Future<int> updateOrderStatus(int id, String status) async {
  final dbClient = await database;
  int result = await dbClient.update(
    TABLE_ORDERS,
    { COLUMN_ORDER_STATUS: status },
    where: '$COLUMN_ORDER_ID = ?',
    whereArgs: [id],
  );
  return result;
}
// Method to update an order
  Future<void> updateOrder(Order order) async {
    final dbClient = await database;
    await dbClient.update(
      'orders',
      order.toMap(),
      where: 'id = ?',
      whereArgs: [order.id],
    );
  }
Future<int> deleteOrder(int id) async {
  final dbClient = await database;
  int result = await dbClient.delete(
    TABLE_ORDERS,
    where: '$COLUMN_ORDER_ID = ?',
    whereArgs: [id],
  );
  return result;
}

Future<Order?> getOrderById(int id) async {
  final dbClient = await database;
  List<Map> maps = await dbClient.query(
    TABLE_ORDERS,
    where: '$COLUMN_ORDER_ID = ?',
    whereArgs: [id],
  );

  if (maps.isNotEmpty) {
    return Order.fromMap(maps.first.cast<String, dynamic>());
  }
  return null;
}

Future<List<Order>> getAllOrders() async {
  final dbClient = await database;
  List<Map> maps = await dbClient.query(TABLE_ORDERS);

  return List.generate(maps.length, (i) {
    return Order.fromMap(maps[i].cast<String, dynamic>());
  });
}

// Method to get an order by its name
  Future<Order?> getOrderByName(String name) async {
    final dbClient = await database;
    List<Map> result = await dbClient.query(
      'orders', // Assuming 'orders' is your table name
      where: 'name = ?', // Assuming 'name' is the column for the order name
      whereArgs: [name],
    );

    if (result.isNotEmpty) {
      // Assuming you have a fromMap method in your Order class to create an instance from Map
      return Order.fromMap(result.first.cast<String, dynamic>());
    }
    return null; // Return null if no order is found
  }

  close() {}
}

