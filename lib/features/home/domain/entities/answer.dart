class Answer {
  int? id;
  List<CorrectOptions>? correctOptions;

  Answer({this.id, this.correctOptions});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['correct_options'] != null) {
      correctOptions = <CorrectOptions>[];
      json['correct_options'].forEach((v) {
        correctOptions!.add(CorrectOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (correctOptions != null) {
      data['correct_options'] =
          correctOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  void fetchAnswer(String? id) {}
}

class CorrectOptions {
  String? id;
  String? answer;

  CorrectOptions({this.id, this.answer});

  CorrectOptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['answer'] = answer;
    return data;
  }
}