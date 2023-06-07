class Following {
  String? type;
  int? id;
  String? playlist;
  String? flashcardFront;
  String? flashcardBack;
  String? description;
  User? user;

  Following(
      {this.type,
      this.id,
      this.playlist,
      this.flashcardFront,
      this.flashcardBack,
      this.description,
      this.user});

  Following.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    playlist = json['playlist'];
    flashcardFront = json['flashcard_front'];
    flashcardBack = json['flashcard_back'];
    description = json['description'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['playlist'] = playlist;
    data['flashcard_front'] = flashcardFront;
    data['flashcard_back'] = flashcardBack;
    data['description'] = description;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? avatar;

  User({this.name, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['avatar'] = avatar;
    return data;
  }
}