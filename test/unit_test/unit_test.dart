import 'package:khidma_app/screens.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('Database Tests', () {
    late DatabaseProvider dbProvider;
    late Order testOrder;
// Initialize sqflite for test
  sqfliteFfiInit();

  // Use sqflite_common_ffi's database factory for your tests
  databaseFactory = databaseFactoryFfi;

    setUp(() async {
      dbProvider = DatabaseProvider();
      // Initialize your database here or mock it.

      // Create a test order object.
      testOrder = Order(
        name: 'Test Order',
        date: '01/01/2021',
        description: 'This is a test order',
        customerPhone: '1234567890',
        status: 'incomplete', id: 1,
      );

      // Insert the test order into the database.
      await dbProvider.insertOrder(testOrder);
    });

    test('Insert Order Test', () async {
      // Retrieve the order by its name or any unique identifier
      final retrievedOrder = await dbProvider.getOrderByName('Test Order');
      expect(retrievedOrder, isNotNull);
      expect(retrievedOrder!.name, equals(testOrder.name));
      expect(retrievedOrder.date, equals(testOrder.date));
      expect(retrievedOrder.description, equals(testOrder.description));
      expect(retrievedOrder.customerPhone, equals(testOrder.customerPhone));
      expect(retrievedOrder.status, equals(testOrder.status));
    });


    // More tests to cover other database operations like update and delete
    test('Update Order Status Test', () async {
      // Assuming you have a method to update order status
      await dbProvider.updateOrderStatus(testOrder.id, 'completed');
      final updatedOrder = await dbProvider.getOrderById(testOrder.id);

      expect(updatedOrder, isNotNull);
      expect(updatedOrder!.status, equals('completed'));
    });

    test('Delete Order Test', () async {
      // Assuming you have a method to delete orders
      await dbProvider.deleteOrder(testOrder.id);
      final deletedOrder = await dbProvider.getOrderById(testOrder.id);

      expect(deletedOrder, isNull);
    });

   test('Query Non-existent Order Test', () async {
    // Attempt to retrieve an order that doesn't exist
    final result = await dbProvider.getOrderById(-1); // Assuming -1 is an unlikely ID for any order
    expect(result, isNull);
  });

  test('Update Order Test', () async {
    // Assuming you have a method to update an order
    await dbProvider.updateOrder(testOrder.copyWith(status: 'completed'));
    final updatedOrder = await dbProvider.getOrderById(testOrder.id);

    expect(updatedOrder, isNotNull);
    expect(updatedOrder!.status, equals('completed'));
  });

  // ... More tests ...

  tearDown(() async {
    // Clean up the database or mock if necessary.
    // This may involve deleting test data or resetting the database state
  });
});
group('User Authentication Tests', () {
  late DatabaseProvider dbProvider;

  setUp(() async {
    dbProvider = DatabaseProvider();
    // Initialize your test database here, including adding a test user
    await dbProvider.loginUser('email', 'password'); // Mock method to add a user
  });

  test('User Login Test', () async {
    final bool loginSuccess = await dbProvider.loginUser('email', 'password');
    expect(loginSuccess, isTrue);
  });


   test('User Login Failure Test', () async {
    // Test login failure with incorrect credentials
    final bool loginFailure = await dbProvider.loginUser('wrong_email', 'wrong_password');
    expect(loginFailure, isFalse);
  });

  test('User Registration Test', () async {
    // Assuming you have a method to handle user registration
    final bool registrationSuccess = await dbProvider.registerUser('new_email', 'new_password');
    expect(registrationSuccess, isTrue);
  });
tearDown(() {
    // Clean up actions after each test, if necessary
  });

  });

  // ... Other test groups ...
}
