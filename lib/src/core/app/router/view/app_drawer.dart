import 'package:flutter/material.dart';
import 'package:stackfood/src/core/ui/theme/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer header
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.green),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: AppColors.green),
                ),
                SizedBox(height: 8),
                Text(
                  'StackFood',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),

          // Dummy menu items
          _buildTile(Icons.home, 'Home', () {}),
          _buildTile(Icons.directions_car, 'Item 2', () {}),
          _buildTile(Icons.history, 'Item 3', () {}),
          _buildTile(Icons.settings, 'Item 4', () {}),
        ],
      ),
    );
  }

  Widget _buildTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.green),
      title: Text(title),
      onTap: onTap,
    );
  }
}
