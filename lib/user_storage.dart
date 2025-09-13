// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class UserStorage {
//   UserStorage._privateConstructor();
//   static final UserStorage instance = UserStorage._privateConstructor();
//
//   List<Map<String, String>> users = [];
//
//   // Load users from Shared Preferences
//   Future<void> loadUsers() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? usersJson = prefs.getString('users');
//     if (usersJson != null) {
//       List<dynamic> decoded = jsonDecode(usersJson);
//       users = decoded.map((e) => Map<String, String>.from(e)).toList();
//     }
//   }
//
//   // Save users to Shared Preferences
//   Future<void> saveUsers() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String usersJson = jsonEncode(users);
//     await prefs.setString('users', usersJson);
//   }
//
//   // Add a new user with default status "Active"
//   void addUser(String name, String email, String password) {
//     users.add({
//       'name': name,
//       'email': email,
//       'password': password,
//       'status': 'Active', // Default status
//     });
//     saveUsers(); // Save after adding
//   }
//
//   // Authenticate user only if email, password match and status is "Active"
//   bool authenticate(String email, String password) {
//     final user = getUserByEmail(email);
//     if (user != null && user['password'] == password && user['status'] == 'Active') {
//       return true;
//     }
//     return false;
//   }
//
//   // Get user by email
//   Map<String, String>? getUserByEmail(String email) {
//     try {
//       return users.firstWhere((user) => user['email'] == email);
//     } catch (e) {
//       return null;
//     }
//   }
//
//   // Check if user is blocked
//   bool isUserBlocked(String email) {
//     final user = getUserByEmail(email);
//     if (user != null && user['status'] == 'Blocked') {
//       return true;
//     }
//     return false;
//   }
//
//   // Set user status
//   void setUserStatus(String email, String status) {
//     final index = users.indexWhere((user) => user['email'] == email);
//     if (index != -1) {
//       users[index]['status'] = status;
//       saveUsers();
//     }
//   }
// }
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  UserStorage._privateConstructor();
  static final UserStorage instance = UserStorage._privateConstructor();

  List<Map<String, String>> users = [];

  // Load users from Shared Preferences
  // Future<void> loadUsers() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? usersJson = prefs.getString('users');
  //   if (usersJson != null) {
  //     List<dynamic> decoded = jsonDecode(usersJson);
  //     users = decoded.map((e) => Map<String, String>.from(e)).toList();
  //   }
  // }
  Future<void> loadUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? usersJson = prefs.getString('users');
    if (usersJson != null) {
      print("Users loaded: $usersJson"); // Debugging line
      List<dynamic> decoded = jsonDecode(usersJson);
      users = decoded.map((e) => Map<String, String>.from(e)).toList();
    } else {
      print("No users found in SharedPreferences"); // Debugging line
    }
  }


  // Save users to Shared Preferences
  // Future<void> saveUsers() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String usersJson = jsonEncode(users);
  //   await prefs.setString('users', usersJson);
  // }
  Future<void> saveUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String usersJson = jsonEncode(users);
    await prefs.setString('users', usersJson);
    // print("Users saved: $usersJson"); // Debugging line
  }


  // Add a new user with status passed from Add User Page
  Future<void> addUser(String name, String email, String password, String status) async {
    users.add({
      'name': name,
      'email': email,
      'password': password,
      'status': status, // Set from Add User Page
    });
    await saveUsers(); // Save after adding
  }

  // Authenticate user only if email, password match and status is "Active"
  bool authenticate(String email, String password) {
    final user = getUserByEmail(email);
    if (user != null && user['password'] == password && user['status'] == 'Active') {
      return true;
    }
    return false;
  }

  // Get user by email
  Map<String, String>? getUserByEmail(String email) {
    try {
      return users.firstWhere((user) => user['email'] == email);
    } catch (e) {
      return null;
    }
  }

  // Check if user is blocked
  bool isUserBlocked(String email) {
    final user = getUserByEmail(email);
    if (user != null && user['status'] == 'Blocked') {
      return true;
    }
    return false;
  }

  // Set user status (Active or Blocked)
  // Future<void> setUserStatus(String email, String status) async {
  //   final index = users.indexWhere((user) => user['email'] == email);
  //   if (index != -1) {
  //     users[index]['status'] = status;
  //     await saveUsers();
  //   }
  // }
  Future<void> setUserStatus(String email, String status) async {
    final index = users.indexWhere((user) => user['email'] == email);
    if (index != -1) {
      users[index]['status'] = status;
      // print("Setting status for $email to $status"); // Debugging line
      await saveUsers();
    }
  }

}
