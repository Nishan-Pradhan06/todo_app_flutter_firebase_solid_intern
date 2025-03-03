import 'package:flutter/material.dart';

class TodoWidget extends StatelessWidget {
  final String title;
  final String description;

  const TodoWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.deepPurple[50],
        borderRadius: BorderRadius.circular(8), // Adding rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(height: 8), // Space between title and description
          Text(
            description,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2, // Limit description to 2 lines
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit_outlined),
          ),
        ],
      ),
    );
  }
}
