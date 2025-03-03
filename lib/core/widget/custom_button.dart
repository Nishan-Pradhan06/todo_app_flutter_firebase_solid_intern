import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  final Widget label;
  final VoidCallback? onPressed;
  const CustomAuthButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        MediaQuery.of(context).size.width * 0.06,
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: label,
      ),
    );
  }
}
