class TodosModel {
  final String? id;
  final String title;
  final String description;
  final String time;
  final bool isCompleted;

  TodosModel({
    this.id,
    required this.title,
    required this.description,
    required this.time,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "time": time,
      "isCompleted": isCompleted,
    };
  }

  factory TodosModel.fromJson(String id, Map<String, dynamic> json) {
    return TodosModel(
      id: id,
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      time: json["time"] ?? "",
      isCompleted: json["isCompleted"] ?? false,
    );
  }
}
