import 'package:email_validator/email_validator.dart';
import 'package:expense_tracker/app/app_colors.dart';
import 'package:expense_tracker/features/auth/presentation/pages/register_page.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/app_logo_widget.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/custom_icon_button_widget.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/password_input_fild.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../app/assets_path.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 12),
                  AppLogoWidget(),
                  Text(
                    textAlign: TextAlign.center,
                    'Welcome back! Glad to see you, Again!',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
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
                    hintText: 'Enter your password',
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: ThemeData().textTheme.titleMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text('Login'),
                  ),

                  SizedBox(height: 28),

                  Text(
                    'Or Login with',
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
      ),
    );
  }

  void _onTapLoginButton() {}

  void _onTapRegisterButton() {}

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
