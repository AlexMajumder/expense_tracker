import 'package:email_validator/email_validator.dart';
import 'package:expense_tracker/app/app_colors.dart';
import 'package:expense_tracker/features/auth/presentation/pages/register_page.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/app_logo_widget.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/custom_icon_button_widget.dart';
import 'package:expense_tracker/shared/widgets/password_input_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/assets_path.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const name = '/login';

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
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                } else if (state is LoginSuccess) {
                  context.go(HomePage.name);
                }
              },
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 12),
                      const AppLogoWidget(),
                      Text(
                        textAlign: TextAlign.center,
                        'Welcome back! Glad to see you, Again!',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
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
                          onPressed: () {
                            // forgot password action here
                          },
                          child: Text(
                            'Forgot Password?',
                            style: ThemeData().textTheme.titleMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      state is LoginLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(
                              LoginSubmitted(
                                _emailTEController.text,
                                _passwordTEController.text,
                              ),
                            );
                          }
                        },
                        child: const Text('Login'),
                      ),
                      const SizedBox(height: 28),
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
                      const SizedBox(height: 32),
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
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const RegisterPage(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
