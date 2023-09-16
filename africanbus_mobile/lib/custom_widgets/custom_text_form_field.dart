import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final bool isPasswordField;
  final TextEditingController controller;
  final bool enabled;
  const CustomTextFormField({
    required Key key,
    required this.labelText,
    required this.icon,
    required this.controller,
    this.isPasswordField = false,
    this.enabled = false
  }):super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black.withOpacity(0.5)
      ),
      decoration: InputDecoration(
        focusColor: Colors.teal,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.teal.shade900,
                width: 2
            )
        ),
        labelText: widget.labelText.toUpperCase(),
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey.withOpacity(0.8)
        ),
        prefixIcon: widget.icon == widget.icon ? Icon( widget.icon,color: Colors.teal.shade900.withOpacity(0.4),): null,
        suffixIcon: widget.isPasswordField
            ? _buildPasswordFieldVisibilityToggle()
            : null,
      ),
      cursorColor: Colors.teal.shade900,
      obscureText: widget.isPasswordField ? _obscureText : false,
      controller: widget.controller,
      enabled: widget.enabled,
    );
  }

  Widget _buildPasswordFieldVisibilityToggle() {
    return IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,color: Colors.teal.shade900,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}
