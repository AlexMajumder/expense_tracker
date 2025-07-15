import 'package:expense_tracker/app/app_colors.dart';
import 'package:expense_tracker/features/profile/presentation/pages/update_profile_page.dart';
import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/profile_header_widget.dart';

class ProfileInformationPage extends StatefulWidget {
  const ProfileInformationPage({super.key});


  @override
  State<ProfileInformationPage> createState() => _ProfileInformationPageState();
}

class _ProfileInformationPageState extends State<ProfileInformationPage> {
  bool _showPassword = false;
  String password = '123456';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          spacing: 8,
          children: [
            ProfileHeaderWidget(),
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 48,
                        width: 48,
                        child: FloatingActionButton(
                          backgroundColor: Color(0xfffece6f0),
                          onPressed: _onTapGotoProfileUpdatePage,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.edit, color: AppColors.themeColor),
                        ),
                      ),
                    ],
                  ),

                  _buildInformationItem(title: 'Name', data: 'Alex Majumder'),
                  _buildInformationItem(title: 'Email', data: 'alexmajumder55@gmail.com'),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _showPassword ? password : '*' * password.length,
                              style:  ThemeData().textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                letterSpacing: _showPassword ? 0.0 : 1.5,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: SizedBox(
                              height: 13,
                              child: Icon(
                                _showPassword ? Icons.visibility_off : Icons.visibility,
                                color: Colors.grey[600],
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

                  _buildInformationItem(title: 'Number of cards', data: '1'),
                  _buildInformationItem(title: 'Number of Bank Accounts', data: '2'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInformationItem({required String title, required String data}) {
    return Column(
      spacing: 2,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.grey)),
        Text(
          data,
          style: ThemeData().textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  _onTapGotoProfileUpdatePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateProfilePage(),
      ),
    );
  }
}
