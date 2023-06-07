import 'package:quizlr_tiktok_clone/features/home/domain/entities/answer.dart';

class AnswerModel extends Answer {
  AnswerModel({
    int? id,
    List<CorrectOptionsModel>? correctOptions,
  }) : super(
          id: id,
          correctOptions: correctOptions,
        );

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      id: json['id'],
      correctOptions: json['correct_options'] != null
          ? List<CorrectOptionsModel>.from(
              json['correct_options'].map(
                (option) => CorrectOptionsModel.fromJson(option),
              ),
            )
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (correctOptions != null) {
      data['correct_options'] =
          correctOptions!.map((option) => option.toJson()).toList();
    }
    return data;
  }
}

class CorrectOptionsModel extends CorrectOptions {
  CorrectOptionsModel({
    String? id,
    String? answer,
  }) : super(
          id: id,
          answer: answer,
        );

  factory CorrectOptionsModel.fromJson(Map<String, dynamic> json) {
    return CorrectOptionsModel(
      id: json['id'],
      answer: json['answer'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['answer'] = answer;
    return data;
  }
}
