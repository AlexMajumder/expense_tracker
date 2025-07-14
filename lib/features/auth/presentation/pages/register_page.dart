import 'package:email_validator/email_validator.dart';
import 'package:expense_tracker/app/app_colors.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/app_logo_widget.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/custom_icon_button_widget.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/password_input_fild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../app/assets_path.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController = TextEditingController();
  final TextEditingController _userNameTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SafeArea(
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 12),
                AppLogoWidget(),
                Text(
                  textAlign: TextAlign.center,
                  'Nice to meet you',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Before we begin, we need some details',
                  style: TextStyle(
                    color: Color(0xFF564E60),
                    fontSize: 16.29,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4),
                _buildForm(),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _onTapLoginButton,
                  child: const Text('Login'),
                ),
                SizedBox(height: 8),

                Text(
                  'Or Register with',
                  style: ThemeData().textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(svgPath: AssetsPath.facebookSvg),
                    CustomIconButton(svgPath: AssetsPath.googleSvg),
                    CustomIconButton(svgPath: AssetsPath.appleSvg),
                  ],
                ),
                SizedBox(height: 32),
                Text.rich(
                  TextSpan(
                    text: "Don’t have an account? ",
                    style: ThemeData().textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "Register Now",
                        style: ThemeData().textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.themeColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _onTapRegisterButton,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _userNameTEController,
            decoration: const InputDecoration(hintText: 'Username'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Username';
              }
              return null;
            },
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _emailTEController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Enter your email'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your email address';
              }
              if (!EmailValidator.validate(value!)) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          PasswordInputFieldWidget(
            controller: _passwordTEController,
            hintText: 'Password',
          ),
          PasswordInputFieldWidget(
            controller: _passwordTEController,
            hintText: 'Confirm password',
          ),
        ],
      ),
    );
  }



  void _onTapLoginButton() {}

  void _onTapRegisterButton() {}

  @override
  void dispose() {
    _emailTEController.dispose();
    _userNameTEController.dispose();
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }

}
