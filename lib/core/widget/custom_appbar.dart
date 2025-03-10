import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;
  final bool? automaticallyImplyLeading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.automaticallyImplyLeading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      centerTitle: true,
      backgroundColor: Colors.deepPurple[300],
      foregroundColor: Colors.white,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize {
    if (bottom != null) {
      return Size.fromHeight(kToolbarHeight + 50);
    }
    return Size.fromHeight(50);
  }
}
