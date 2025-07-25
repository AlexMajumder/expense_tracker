import 'package:expense_tracker/shared/widgets/password_input_field_widget.dart';
import 'package:flutter/material.dart';
import '../../../../shared/widgets/app_bar_widget.dart';
import '../widgets/profile_header_widget.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

final TextEditingController _nameTEController = TextEditingController(
  text: 'Alex',
);
final TextEditingController _emailTEController = TextEditingController(
  text: 'alex@gmail.com',
);
final TextEditingController _passwordTEController = TextEditingController(
  text: '12354',
);

class _UpdateProfilePageState extends State<UpdateProfilePage> {
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
                spacing: 16,
                children: [
                  TextFormField(
                    controller: _nameTEController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Alex',
                    ),
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'alex@gmail.com',
                    ),
                  ),

                  PasswordInputFieldWidget(
                    controller: _passwordTEController,
                    hintText: '%jiksi',
                    labelText: 'Password',
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Number of cards',
                      hintText: '1',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Number of Bank Accounts',
                      hintText: '1',
                    ),
                  ),

                  SizedBox(height: 24),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Update Profile'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
