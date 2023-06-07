import 'package:quizlr_tiktok_clone/features/home/domain/entities/following.dart';

class FollowingModel extends Following {
  FollowingModel({
    String? type,
    int? id,
    String? playlist,
    String? flashcardFront,
    String? flashcardBack,
    String? description,
  }) : super(
          type: type,
          id: id,
          playlist: playlist,
          flashcardFront: flashcardFront,
          flashcardBack: flashcardBack,
          description: description,
        );
  factory FollowingModel.fromMap(Map<String, dynamic> map) {
    return FollowingModel(
      type: map['type'],
      id: map['id'],
      playlist: map['playlist'],
      flashcardFront: map['flashcard_front'],
      flashcardBack: map['flashcard_back'],
      description: map['description'],
    );
  }
}
