import 'package:flutter/material.dart';
import 'package:flutter_batch_two_assignment/view/student_portal_view/widgets/header_section_widget.dart';
import 'package:flutter_batch_two_assignment/view/student_portal_view/widgets/menu_item_widgets.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // header_section_by_column
              HeaderSectionWidget(),

              SizedBox(height: 18),

              /// quick action section by row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MenuItem(
                      title: 'My course',
                      icon: Icons.menu_book_rounded,
                      color: Colors.red,
                      onTap: () {



                        /* Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SecondScreen()),
                      );*/
                      },
                    ),

                    MenuItem(
                      title: 'My Profile',
                      icon: Icons.menu_book_rounded,
                      color: Colors.green,
                      onTap: (){


                        /// profile e pathabo

                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              /// title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upcoming Classes',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


