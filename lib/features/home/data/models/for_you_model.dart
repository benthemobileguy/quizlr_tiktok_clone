import 'package:quizlr_tiktok_clone/features/home/domain/entities/for_you.dart';

class ForYouModel extends ForYou {
  ForYouModel({
    String? type,
    int? id,
    String? playlist,
    String? description,
    String? image,
    String? question,
    List<Options>? options,
    User? user,
  }) : super(
          type: type,
          id: id,
          playlist: playlist,
          description: description,
          image: image,
          question: question,
          options: options,
          user: user,
        );
  factory ForYouModel.fromMap(Map<String, dynamic> map) {
    return ForYouModel(
      type: map['type'],
      id: map['id'],
      playlist: map['playlist'],
      description: map['description'],
      image: map['image'],
      question: map['question'],
      options:
          List<Options>.from(map['options']?.map((x) => Options.fromMap(x))),
      user: User.fromMap(map['user']),
    );
  }
}
