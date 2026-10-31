import 'package:flutter/material.dart';
import 'package:flutter_batch_two_assignment/view/profile_view/widgets/profile_menu_item.dart';

class ProflleView extends StatelessWidget {
  const ProflleView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Top Section: Cover Image and Profile Picture
          SizedBox(
            height: 280,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Cover Image
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile_cover.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
                // Profile Image
                Positioned(
                  top: 140,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Menu Items
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileMenuItem(
                  icon: Icons.person_outline,
                  title: 'My ProFile',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.settings_outlined,
                  title: 'Account Setting',
                  onTap: () {},
                ),

                const SizedBox(height: 15),
                const Text(
                  'More',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),

                ProfileMenuItem(
                  icon: Icons.description_outlined,
                  title: 'Terms & Condition',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.privacy_tip_outlined,
                  title: 'Privacy policy',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.help_outline,
                  title: 'Help/Support',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.logout,
                  title: 'Log Out',
                  iconColor: Colors.red,
                  onTap: () {},
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
