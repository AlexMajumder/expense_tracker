import 'package:expense_tracker/features/profile/presentation/pages/profile_information_page.dart';
import 'package:flutter/material.dart';
import '../../../../shared/widgets/app_bar_widget.dart';
import '../widgets/profile_header_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(title: 'Profile', actionIcon: Icons.notifications,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeaderWidget(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                spacing: 12,
                children: [
                  _buildRowItem(
                    title: 'Invite Friends',
                    iconData: Icons.diamond_outlined,
                    iconColor: Colors.lightBlue,
                  ),
                  SizedBox(height: 2),
                  Divider(color: Colors.grey[300], height: 1),
                  SizedBox(height: 2),
                  _buildRowItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileInformationPage(),
                        ),
                      );
                    },
                    title: 'Account info',
                    iconData: Icons.person,
                  ),
                  _buildRowItem(
                    title: 'Login and security',
                    iconData: Icons.security_rounded,
                  ),
                  _buildRowItem(
                    title: 'Data and privacy',
                    iconData: Icons.lock_sharp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowItem({
    required String title,
    IconData? iconData,
    Color? iconColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        spacing: 16,
        children: [
          Icon(iconData, color: iconColor ?? Colors.grey, weight: 33),
          Text(
            title,
            style: ThemeData().textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
