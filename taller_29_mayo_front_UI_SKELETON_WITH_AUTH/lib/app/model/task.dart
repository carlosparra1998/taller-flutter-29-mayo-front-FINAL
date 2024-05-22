class Task {
  String? uuidTask;
  String? userName;
  String? title;
  String? description;
  String? color;
  bool? active;

  Task({
    required this.uuidTask,
    required this.userName,
    required this.title,
    required this.description,
    required this.color,
    required this.active,
  });

  Task.fromJson(Map<String, dynamic> json) {
    uuidTask = json['uuidTask'];
    userName = json['userName'];
    title = json['title'];
    description = json['description'];
    color = json['color'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['title'] = title;
    json['description'] = description;
    json['color'] = color;
    json['active'] = active;
    return json;
  }
}
