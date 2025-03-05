import 'package:flutter/material.dart';

class TodosWidget extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final bool isCompleted; // Accept the completion status
  final Function(bool?) onToggle; // Callback for checkbox changes

  const TodosWidget({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.isCompleted,
    required this.onToggle, // Pass the callback
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Checkbox(
            value: isCompleted, // Bind the checkbox value
            onChanged: onToggle, // Trigger the callback when toggled
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Card(
                color: isCompleted
                    ? Colors.green[50]
                    : Colors.deepPurple[50], // Change color based on completion
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              decoration: isCompleted
                                  ? TextDecoration
                                      .lineThrough // Strike through if completed
                                  : null,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            time,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          decoration: isCompleted
                              ? TextDecoration
                                  .lineThrough // Strike through if completed
                              : null,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
