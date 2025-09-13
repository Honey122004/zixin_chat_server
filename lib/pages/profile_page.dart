import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../user_storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Loading...';
  String email = 'Loading...';

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    print("Loading Profile...");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loggedInEmail = prefs.getString('logged_in_email');
    print("Retrieved logged-in email: $loggedInEmail");

    if (loggedInEmail != null) {
      await UserStorage.instance.loadUsers();
      print("Users after loading: ${UserStorage.instance.users}");

      try {
        final user = UserStorage.instance.users.firstWhere(
              (user) => user['email'] == loggedInEmail,
        );

        setState(() {
          name = user['name'] ?? 'Unknown';
          email = user['email'] ?? 'Unknown';
        });
      } catch (e) {
        // User not found
        setState(() {
          name = 'User not found';
          email = '';
        });
      }
    } else {
      print("No logged-in email found");
      setState(() {
        name = 'No user logged in';
        email = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.pink.shade100,
              child: const Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.pink),
              title: Text(name, style: const TextStyle(fontSize: 18)),
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.pink),
              title: Text(email, style: const TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
