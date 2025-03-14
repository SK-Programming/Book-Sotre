import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/screens/books.dart';
import 'package:myapp/screens/cart.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/login.dart';
import 'package:myapp/screens/profile.dart';
import 'package:myapp/screens/search.dart';
import "package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart";

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  bool isLoggedIn = true; // Example condition

  List<Widget> _buildScreens() {
    return [Home(), Search(), Books(), Cart(), Profile()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.home),
        title: ("Home"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: ("Search"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Transform.translate(
          offset: const Offset(0, -10),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.book,
              color: Color.fromARGB(0, 255, 255, 255),
              size: 28,
            ),
          ),
        ),
        title: ("Search"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  void _showDropdownMenu(BuildContext context) async {
    final selected = await showMenu<int>(
      context: context,
      position: const RelativeRect.fromLTRB(100, 80, 0, 0),
      items: [
        const PopupMenuItem<int>(
          value: 1,
          child: Text("Profile"),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Text("Settings"),
        ),
        const PopupMenuItem<int>(
          value: 3,
          child: Text("Logout"),
        ),
      ],
    );

    if (selected != null) {
      switch (selected) {
        case 1:
 Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => const Login()),
);
          break;
        case 2:
          // Navigate to Settings
          break;
        case 3:
          // Perform Logout
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu, color: Theme.of(context).primaryColor),
        actions: [
          Icon(Icons.notifications, color: Theme.of(context).primaryColor),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                if (isLoggedIn) {
                  _showDropdownMenu(context);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                }
              },
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 145, 145, 145),
                child: const Icon(Icons.person, color: Colors.white),
                minRadius: 20,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PersistentTabView(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            decoration: NavBarDecoration(
              colorBehindNavBar: Theme.of(context).scaffoldBackgroundColor,
            ),
            navBarStyle: NavBarStyle.style12,
            margin: EdgeInsets.zero,
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: GestureDetector(
              onTap: () {
                _controller.jumpToTab(2);
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.book, color: Colors.white, size: 32),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
