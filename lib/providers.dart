import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens.dart';

import 'package:crypto/crypto.dart';

class UserProvider with ChangeNotifier {
  final DatabaseProvider _databaseProvider;
  
  BuildContext? context;

  UserProvider(this._databaseProvider);

  Future<bool> signUp(String userName, String phoneNumber, String email,
      String password, String userType) async {
    try {
      // Hash the password
      var bytes = utf8.encode(password); // data being hashed
      var hashedPassword = sha256.convert(bytes).toString();

      // Prepare the user data with the hashed password
      final userData = {
        'user_name': userName,
        'phone_number': phoneNumber,
        'email': email,
        'password': hashedPassword,
        'user_type': userType, // Include the user type
      };

      // Insert the user data into the database
      await _databaseProvider.insertUser(userData);
      return true;
   } catch (e) {
  if (kDebugMode) {
    print("Signup error: $e");
  }
  return false;
}

  }

  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      // Hash the password for comparison
      var bytes = utf8.encode(password); // data being hashed
      var hashedPassword = sha256.convert(bytes).toString();

      // Retrieve the user by email and hashed password
      var user = await _databaseProvider.getUserByEmailAndPassword(
          email, hashedPassword);
      if (user != null) {
        // Update state or perform any other necessary actions
        notifyListeners();
        return user;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  // Method to update a user's details
  Future<bool> updateUser(int id, Map<String, dynamic> updatedData) async {
    try {
      await _databaseProvider.updateUser(id, updatedData);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Method to delete a user
  Future<bool> deleteUser(int id) async {
    try {
      await _databaseProvider.deleteUser(id);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Method to handle worker registration or updates
  Future<bool> handleWorker(Map<String, dynamic> workerData, {int? id}) async {
    try {
      if (id == null) {
        await _databaseProvider.insertWorker(workerData); // Add new worker
      } else {
        await _databaseProvider.updateWorker(
            id, workerData); // Update existing worker
      }
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Method to handle order creation or updates


  // Add any additional methods that your application requires
}



 