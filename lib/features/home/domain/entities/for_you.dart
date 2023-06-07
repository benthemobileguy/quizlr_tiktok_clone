class ForYou {
  String? type;
  int? id;
  String? playlist;
  String? description;
  String? image;
  String? question;
  List<Options>? options;
  User? user;

  ForYou(
      {this.type,
      this.id,
      this.playlist,
      this.description,
      this.image,
      this.question,
      this.options,
      this.user});

  ForYou.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    playlist = json['playlist'];
    description = json['description'];
    image = json['image'];
    question = json['question'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['playlist'] = playlist;
    data['description'] = description;
    data['image'] = image;
    data['question'] = question;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Options {
  String? id;
  String? answer;
  bool isSelected = false;

  Options({this.id, this.answer, required bool isSelected});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
  }
 factory Options.fromMap(Map<String, dynamic> map) {
    return Options(
      id: map['id'],
      answer: map['answer'],
       isSelected: false,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['answer'] = answer;
    return data;
  }
}

class User {
  String? name;
  String? avatar;

  User({this.name, this.avatar});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      avatar: map['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['avatar'] = avatar;
    return data;
  }
  
 factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      avatar: json['avatar'],
    );
  }
}

