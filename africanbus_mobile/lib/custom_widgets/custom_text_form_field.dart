import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final bool isPasswordField;
  final bool isTexterea;
  final TextEditingController controller;
  final bool enabled;
  final bool isOutlined ;
  final bool isEmailField ;
  const CustomTextFormField({
    required Key key,
    required this.labelText,
    required this.icon,
    required this.controller,
    this.isOutlined = true ,
    this.isEmailField = false ,
    this.isPasswordField = false,
    this.isTexterea = false,
    this.enabled = false
  }):super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;
  RegExp get _emailRegex => RegExp(r'^\S+@\S+$');

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if(widget.isEmailField == true){
          if (!_emailRegex.hasMatch(value!)) {
            return "Enter une adresse E-mail valide !";
          }
        }else{
          if(value!.isEmpty){
            return "Ce champs est requis";
          }
        }
      },
      maxLines: widget.isTexterea == true ? 3 : 1,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black.withOpacity(0.5)
      ),
      decoration: InputDecoration(
        border: widget.isOutlined == true ? OutlineInputBorder() : null,
        focusColor: Colors.teal,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.teal.shade900,
                width: 2
            )
        ),
        labelText: widget.labelText.toUpperCase(),
        labelStyle: TextStyle(
          fontSize: 12,
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
