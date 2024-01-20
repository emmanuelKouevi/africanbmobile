import 'package:flutter/material.dart';

class SimpleTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool enabled;
  final VoidCallback onChanged;
  //final bool isOutlined ;
  const SimpleTextField({
    required this.labelText, required this.controller,
    required this.enabled, required this.onChanged,
    //required this.isOutlined,
    Key ? key}):super(key: key);

  @override
  State<SimpleTextField> createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<SimpleTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle( fontSize: 17 , fontWeight: FontWeight.bold , color: Colors.black.withOpacity(0.7) ),
      controller: widget.controller,
      onChanged: (value) => widget.onChanged,
      decoration: InputDecoration(
          border: UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.teal.shade900,
                  width: 2
              )
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.teal.shade900,
                  width: 2
              )
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: Colors.teal
          )
      ),
    );
  }
}
