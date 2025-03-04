import 'package:flutter/material.dart';

class CustomFormFieldWidget extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  final TextInputType? keys;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double? vertical;

  const CustomFormFieldWidget({
    super.key,
    required this.label,
    this.suffixIcon,
    this.onPressed,
    this.controller,
    this.validator,
    this.keys,
    this.obscureText = false,
    this.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height * 0.025),
      child: TextFormField(
        textAlign: TextAlign.start,
        validator: validator,
        obscureText: obscureText,
        controller: controller,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          hintText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), // Rounded border
            borderSide: BorderSide(
              color: Colors.black54,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ), // Focused color
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.5,
            ), // Error color
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  icon: Icon(suffixIcon),
                  onPressed: onPressed,
                )
              : null,
          contentPadding: EdgeInsets.symmetric(
            vertical: vertical ?? 15, // Use provided value or default to 20
            horizontal: 16, // Horizontal padding for text alignment
          ),
        ),
        keyboardType: keys,
      ),
    );
  }
}
