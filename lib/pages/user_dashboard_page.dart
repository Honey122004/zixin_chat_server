// import 'package:flutter/material.dart';
//
// import 'chat_page.dart';
//
// class UserDashboardPage extends StatelessWidget {
//   const UserDashboardPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Overview dashboard'),
//         centerTitle: false,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               InfoCard(
//                 title: 'Orders',
//                 mainValue: '932.00',
//                 subText: 'Completed',
//                 subValue: '5443',
//                 icon: Icons.lightbulb,
//               ),
//               const SizedBox(height: 20),
//               InfoCard(
//                 title: 'Unique Visitors',
//                 mainValue: '756,00',
//                 subText: 'Increased since yesterday',
//                 subValue: '50%',
//                 icon: Icons.person,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class SideBar extends StatelessWidget {
//   final Function(String, Widget) onMenuSelect; // callback for menu clicks
//
//   const SideBar({super.key, required this.onMenuSelect}); // <--- make sure this exists
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         const DrawerHeader(
//           decoration: BoxDecoration(color: Colors.pinkAccent),
//           child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
//         ),
//         ListTile(
//           leading: const Icon(Icons.dashboard),
//           title: const Text('Dashboard'),
//           onTap: () => onMenuSelect('Dashboard', const UserDashboardPage()),
//         ),
//         ListTile(
//           leading: const Icon(Icons.chat),
//           title: const Text('Chat Page'),
//           onTap: () => onMenuSelect('Chat', const ChatPage()),
//         ),
//
//
//       ],
//     );
//   }
// }
//
//
//
// class InfoCard extends StatelessWidget {
//   final String title;
//   final String mainValue;
//   final String subText;
//   final String subValue;
//   final IconData icon;
//
//   const InfoCard({
//     super.key,
//     required this.title,
//     required this.mainValue,
//     required this.subText,
//     required this.subValue,
//     required this.icon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//         child: Column(
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 color: Colors.indigo.shade900,
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               mainValue,
//               style: const TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Icon(
//               icon,
//               size: 36,
//               color: Colors.indigo,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               subText,
//               style: TextStyle(
//                 color: Colors.grey.shade600,
//                 fontSize: 14,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               subValue,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:zixin_chat_server/pages/profile_page.dart';
import '../login_page.dart';
import 'chat_page.dart';


class UserDashboardPage extends StatelessWidget {
  const UserDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZChat Dashboard',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        // appBar: AppBar(
        //   title: const Text("Overview dashboard"),
        //   backgroundColor: Colors.indigo,
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                MetricCard(
                  title: "Orders",
                  value: "932.00",
                  icon: Icons.lightbulb_outline,
                  subtitle: "Completed",
                  subtitleValue: "5443",
                  color: Colors.pink.shade500,
                ),
                const SizedBox(height: 16),
                MetricCard(
                  title: "Unique Visitors",
                  value: "756,00",
                  icon: Icons.person_outline,
                  subtitle: "Increased since yesterday",
                  subtitleValue: "50%",
                  color: Colors.redAccent,
                ),
                const SizedBox(height: 16),
                MetricCard(
                  title: "Impressions",
                  value: "100,38",
                  icon: Icons.remove_red_eye_outlined,
                  subtitle: "Increased since yesterday",
                  subtitleValue: "35%",
                  color: Colors.indigo,
                ),
                const SizedBox(height: 16),
                MetricCard(
                  title: "Followers",
                  value: "4250k",
                  icon: Icons.widgets_outlined,
                  subtitle: "Decreased since yesterday",
                  subtitleValue: "25%",
                  color: Colors.purpleAccent,
                ),
                const SizedBox(height: 32),
                const Text(
                  "Copyright © 2025\nAll rights reserved by ZIXIN INDIA",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class SideBar extends StatelessWidget {
  final Function(String, Widget) onMenuSelect; // callback for menu clicks

  const SideBar({super.key, required this.onMenuSelect});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.pinkAccent),
          child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          onTap: () => onMenuSelect('Chat', const ProfilePage()),
        ),
        ListTile(
          leading: const Icon(Icons.dashboard),
          title: const Text('Dashboard'),
          onTap: () => onMenuSelect('Dashboard', const UserDashboardPage()),
        ),

        ListTile(
          leading: const Icon(Icons.chat),
          title: const Text('Chat Page'),
          onTap: () => onMenuSelect('Chat', const ChatPage()),
        ),
        const Divider(),
        // Logout Tile
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
            );
          },

        ),

      ],
    );
  }
}


class MetricCard extends StatefulWidget {
  final String title;
  final String value;
  final IconData icon;
  final String subtitle;
  final String subtitleValue;
  final Color color;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.subtitle,
    required this.subtitleValue,
    required this.color,
  });

  @override
  State<MetricCard> createState() => _MetricCardState();
}

class _MetricCardState extends State<MetricCard> {
  bool _isTapped = false;

  void _toggleTap() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isTapped
            ? (Matrix4.identity()..scale(1.05))
            : Matrix4.identity(),
        child: Card(
          elevation: _isTapped ? 8 : 4,
          color: widget.color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // important!
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(widget.icon, size: 32, color: Colors.white),
                    const SizedBox(width: 12),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  widget.value,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16), // replaces Spacer
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.subtitle,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    Text(
                      widget.subtitleValue,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


