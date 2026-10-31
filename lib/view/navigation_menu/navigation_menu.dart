import 'package:flutter/material.dart';
import 'package:flutter_batch_two_assignment/view/home_view/home_view.dart';
import 'package:flutter_batch_two_assignment/view/profile_view/proflle_view.dart';
import 'package:flutter_batch_two_assignment/view/home_view/widgets/custom_bottom_nav.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const Center(child: Text('Add Task Screen')), 
    const ProflleView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
