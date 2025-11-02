class Exo {
  int id;
  String description;
  String? startCode;
  String? input;
  String? output;
  int semester;
  bool isDone;

  Exo({
    required this.id,
    required this.description,
    required this.semester,
    required this.isDone,
    this.input,
    this.output,
    this.startCode,
  });

  factory Exo.fromJson(Map<String, dynamic> json) {
    return Exo(
      id: json['id'],
      description: json['description'],
      startCode: json['start_code'],
      input: json['input_'],
      output: json['output'],
      semester: 2,
      isDone: false,
    );
  }
}
