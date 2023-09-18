import 'package:flutter/material.dart';

class CustomSimpleTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool enabled;
  final VoidCallback onTap;
  final bool isOutlined ;
  const CustomSimpleTextField({
    required Key key,
    required this.labelText,
    required this.enabled,
    required this.onTap,
    required this.controller,
    this.isOutlined = false,
  }):super(key: key);

  @override
  State<CustomSimpleTextField> createState() => _CustomSimpleTextFieldState();
}

class _CustomSimpleTextFieldState extends State<CustomSimpleTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.teal.shade900,
      onTap: widget.onTap,
      decoration: InputDecoration(
        labelText: widget.labelText,
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.w400
        ),
        border: widget.isOutlined ? OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
            width: 5
          )
        ) : null,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
            width: 3
          )
        )
      ),
      enabled: widget.enabled,
      controller: widget.controller,
    );
  }
}
