import 'package:flutter/material.dart';
import '../../../../app/assets_path.dart';
class PasswordInputField extends StatefulWidget {

  final TextEditingController controller;
  final String hintText;

  const PasswordInputField({super.key, required this.controller, required this.hintText});

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText:widget.hintText,
        suffixIcon: IconButton(
          icon: _obscureText
              ? const Icon(Icons.visibility_off, color: Colors.grey)
              : Image.asset(
            AssetsPath.openEye,
            width: 24,
            height: 24,
            color: Colors.grey[700], // optional tint
          ),
          onPressed: _toggleVisibility,
        ),
      ),
      validator: (String? value) {
        if (value?.isEmpty ?? true) {
          return 'Enter valid Password';
        }
        return null;
      },
    );
  }
}
