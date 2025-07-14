import 'package:flutter/material.dart';
class AppBarWidget extends StatelessWidget  implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'Profile',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications, color: Colors.white),
        ),
      ],
    );

  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}