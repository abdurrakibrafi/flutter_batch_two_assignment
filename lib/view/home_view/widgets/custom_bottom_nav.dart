import 'package:flutter/material.dart';
import 'package:flutter_batch_two_assignment/constant/app_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, Icons.home_outlined, 'My Tasks'),
          _buildNavItem(1, Icons.add, 'Add Task'),
          _buildNavItem(2, Icons.person_outline, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 100,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            if (isSelected)
              Positioned(
                top: -30,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Icon(
                    // Home icon should be filled if selected to match typical design, 
                    // but the image shows a specific outline home.
                    index == 0 ? Icons.home_outlined : icon,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              )
            else
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: Colors.black87,
                    size: 28,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
