class TodosModel {
  final String? id;
  final String title;
  final String description;
  final String time; // New field for time

  TodosModel({
    this.id,
    required this.title,
    required this.description,
    required this.time, // Add time as a required field
  });

  // Convert TaskModel to a Map (for Firestore)
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "time": time, // Add time to Firestore
    };
  }

  // Create a TaskModel from a Map (from Firestore)
  factory TodosModel.fromJson(String id, Map<String, dynamic> json) {
    return TodosModel(
      id: id,
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      time: json["time"] ?? "", // Parse time from Firestore
    );
  }
}
