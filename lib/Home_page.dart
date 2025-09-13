import 'package:flutter/material.dart';
import 'package:zixin_chat_server/pages/admin_dashboard_page.dart';


class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  Widget _selectedPage = const AdminDashboardPage();
  String _title = "Dashboard";

  void _onMenuSelect(String title, Widget page) {
    setState(() {
      _title = title;
      _selectedPage = page;
    });
    Navigator.pop(context); // closes drawer on mobile
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 800;

        return Scaffold(
          drawer: isMobile
              ? Drawer(
            child: SideBar(onMenuSelect: _onMenuSelect),
          )
              : null,
          appBar: isMobile
              ? AppBar(
            backgroundColor: Colors.pinkAccent,
            title: Text(_title),
          )
              : null,
          body: Row(
            children: [
              // Permanent sidebar on wide screens
             /* if (!isMobile)
                SizedBox(
                  width: 220,
                  child: SideBar(onMenuSelect: _onMenuSelect),
                ),*/
              // Main content area
              Expanded(child: _selectedPage),
            ],
          ),
        );
      },
    );
  }
}
