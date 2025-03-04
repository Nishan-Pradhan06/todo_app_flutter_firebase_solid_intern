class TodosModel {
  final String? id;
  final String title;
  final String description;

  TodosModel({
     this.id,
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
  factory TodosModel.fromJson(String id, Map<String, dynamic> json) {
    return TodosModel(
      id: id,
      title: json["title"] ?? "",
      description: json["description"] ?? "",
    );
  }
}
