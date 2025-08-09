import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../app/assets_path.dart';

class PasswordInputFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final String? Function(String?)? validator;

  const PasswordInputFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.validator,
  });

  @override
  State<PasswordInputFieldWidget> createState() =>
      _PasswordInputFieldWidgetState();
}

class _PasswordInputFieldWidgetState extends State<PasswordInputFieldWidget> {
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
        hintText: widget.hintText,
        labelText: widget.labelText ?? '',
        suffixIcon: IconButton(
          icon: _obscureText
              ? const Icon(Icons.visibility_off, color: Colors.grey)
              : SvgPicture.asset(AssetsPath.openEyeSvg, width: 14, height: 14),
          onPressed: _toggleVisibility,
        ),
      ),
      validator:
          widget.validator ??
          (String? value) {
            if (value?.isEmpty ?? true) {
              return 'Enter a valid password';
            }
            return null;
          },
    );
  }
}
