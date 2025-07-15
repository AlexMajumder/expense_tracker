import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import '../../../../shared/widgets/header_widget.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 287,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const HeaderWidget(),
              Positioned(
                top: 197,
                left: 0,
                right: 0,
                child: _buildProfileSection(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 110),
      ],
    );
  }

  Widget _buildProfileSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://appdeveloperalex.com/image/ALEXMAJUMDER_squr.jpg',
              ),
            ),
            border: Border.all(color: Colors.white, width: 3),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Alex Majumder',
          style: TextStyle(
            color: Color(0xff222222),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          '@alex578',
          style: TextStyle(
            color: AppColors.themeColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}