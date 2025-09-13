import 'package:flutter/material.dart';
import 'package:zixin_chat_server/website_views.dart';
import '../completed_tasks.dart';
import '../daily_sales.dart';
import '../login_page.dart';
import 'add_user_page.dart';
import 'admin_update_page.dart';
import 'all_files_page.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isMobile = width < 800;

        // Decide number of columns based on screen size
        int crossAxisCount;
        if (width >= 1200) {
          crossAxisCount = 4; // Desktop
        } else if (width >= 800) {
          crossAxisCount = 2; // Tablet
        } else {
          crossAxisCount = 1; // Mobile
        }

        return Scaffold(
          /*drawer: isMobile
              ? SideBar(
            onMenuSelect: (String p1, Widget p2) {},
          )
              : null,
          appBar: isMobile
              ? AppBar(
            backgroundColor: Colors.pinkAccent,
            title: const Text("Dashboard"),
          )
              : null,*/
          body: Row(
            children: [
              // Sidebar only for wide screens
              if (!isMobile)
                SizedBox(
                  width: 220,
                  child: SideBar(
                    onMenuSelect: (String p1, Widget p2) {
                      print("object selected ${p1}");

                      if(p1 == "Dashboard"){
                        AdminDashboardPage();
                      }else if(p1 == "Admin Update"){
                         AdminUpdatePage();
                      }

                    },
                  ),
                ),

              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ✅ Stat Cards Section without fixed height
                        GridView.count(
                          crossAxisCount: crossAxisCount,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.2,
                          children: const [
                            StatCard(
                              icon: Icons.wallet,
                              iconColor: Colors.black87,
                              title: "Today's Money",
                              value: "\$53k",
                              subtitle: "+55% than last week",
                              subtitleColor: Colors.green,
                            ),
                            StatCard(
                              icon: Icons.person,
                              iconColor: Colors.pink,
                              title: "Today's Users",
                              value: "2,300",
                              subtitle: "+3% than last month",
                              subtitleColor: Colors.green,
                            ),
                            StatCard(
                              icon: Icons.group,
                              iconColor: Colors.green,
                              title: "New Clients",
                              value: "3,462",
                              subtitle: "-2% than yesterday",
                              subtitleColor: Colors.red,
                            ),
                            StatCard(
                              icon: Icons.shopping_bag,
                              iconColor: Colors.blue,
                              title: "Sales",
                              value: "\$103,430",
                              subtitle: "+5% than yesterday",
                              subtitleColor: Colors.green,
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // ✅ Charts Section
                        GridView.count(
                          crossAxisCount: crossAxisCount > 2 ? 3 : crossAxisCount,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1.3,
                          children: const [
                            WebsiteViewsChart(),
                            DailySalesChart(),
                            CompletedTasksChart(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
          leading: const Icon(Icons.dashboard),
          title: const Text('Dashboard'),
          onTap: () => onMenuSelect('Dashboard', const AdminDashboardPage()),
        ),
        ListTile(
          leading: const Icon(Icons.update),
          title: const Text('Admin Update Page'),
          onTap: () => onMenuSelect('Admin Update', const AdminUpdatePage()),
        ),
        ListTile(
          leading: const Icon(Icons.person_add),
          title: const Text('Add User Page'),
          onTap: () => onMenuSelect('Add User', const AddUserPage()),
        ),
        ListTile(
          leading: const Icon(Icons.folder),
          title: const Text('All Files Page'),
          onTap: () => onMenuSelect('All Files', const AllFilesPage()),
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
//           onTap: () => onMenuSelect('Dashboard', const AdminDashboardPage()),
//         ),
//         ListTile(
//           leading: const Icon(Icons.update),
//           title: const Text('Admin Update Page'),
//           onTap: () => onMenuSelect('Admin Update', const AdminUpdatePage()),
//         ),
//         ListTile(
//           leading: const Icon(Icons.person_add),
//           title: const Text('Add User Page'),
//           onTap: () => onMenuSelect('Add User', const AddUserPage()),
//         ),
//         ListTile(
//           leading: const Icon(Icons.folder),
//           title: const Text('All Files Page'),
//           onTap: () {
//             print("all file clicked");
//             onMenuSelect('All Files', const AllFilesPage());
//           }
//         ),
//       ],
//     );
//   }
// }


class StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final String subtitle;
  final Color subtitleColor;

  const StatCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Box
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: iconColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(height: 12),

            // Title
            Text(title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // ✅ no wrapping
                style: const TextStyle(fontSize: 14, color: Colors.black54)),

            const SizedBox(height: 6),

            // Value
            Text(value,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold)),

            const SizedBox(height: 6),

            // Subtitle
            Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: subtitleColor),
            ),
          ],
        ),
      ),
    );
  }
}