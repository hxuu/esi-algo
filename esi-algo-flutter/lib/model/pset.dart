class Pset {
  int id;
  int semester;
  String title;
  String topic;

  Pset({
    required this.id,
    required this.semester,
    required this.title,
    required this.topic,
  });

  factory Pset.fromJson(Map<String, dynamic> json) {
    return Pset(
      id: json['id'],
      semester: json['semester'],
      title: json['title'],
      topic: json['topic'],
    );
  }
}
