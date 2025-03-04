class TodosModel {
  final String title;
  final String description;

  TodosModel({
    required this.title,
    required this.description,
  });

  // Convert TaskModel to a Map (for Firestore)
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
    };
  }

  // Create a TaskModel from a Map (from Firestore)
  factory TodosModel.fromJson(Map<String, dynamic> json) {
    return TodosModel(
      title: json["title"] ?? "",
      description: json["description"] ?? "",
    );
  }
}
