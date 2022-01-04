import 'dart:convert';

List<ListofCharacter> listofCharacterFromJson(String str) => List<ListofCharacter>.from(json.decode(str).map((x) => ListofCharacter.fromJson(x)));

String listofCharacterToJson(List<ListofCharacter> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListofCharacter {
  ListofCharacter({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.img,
    required this.status,
    required this.nickname,
    required this.appearance,
    required this.portrayed,
    required this.category,
    required this.betterCallSaulAppearance,
  });

  int charId;
  String name;
  String birthday;
  List<String> occupation;
  String img;
  Status? status;
  String nickname;
  List<int> appearance;
  String portrayed;
  Category? category;
  List<int> betterCallSaulAppearance;

  factory ListofCharacter.fromJson(Map<String, dynamic> json) => ListofCharacter(
    charId: json["char_id"],
    name: json["name"],
    birthday: json["birthday"],
    occupation: List<String>.from(json["occupation"].map((x) => x)),
    img: json["img"],
    status: statusValues.map[json["status"]],
    nickname: json["nickname"],
    appearance: List<int>.from(json["appearance"].map((x) => x)),
    portrayed: json["portrayed"],
    category: categoryValues.map[json["category"]],
    betterCallSaulAppearance: List<int>.from(json["better_call_saul_appearance"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "char_id": charId,
    "name": name,
    "birthday": birthday,
    "occupation": List<dynamic>.from(occupation.map((x) => x)),
    "img": img,
    "status": statusValues.reverse![status],
    "nickname": nickname,
    "appearance": List<dynamic>.from(appearance.map((x) => x)),
    "portrayed": portrayed,
    "category": categoryValues.reverse![category],
    "better_call_saul_appearance": List<dynamic>.from(betterCallSaulAppearance.map((x) => x)),
  };
}

enum Category { BREAKING_BAD, BREAKING_BAD_BETTER_CALL_SAUL }

final categoryValues = EnumValues({
  "Breaking Bad": Category.BREAKING_BAD,
  "Breaking Bad, Better Call Saul": Category.BREAKING_BAD_BETTER_CALL_SAUL
});

enum Status { PRESUMED_DEAD, ALIVE, DECEASED }

final statusValues = EnumValues({
  "Alive": Status.ALIVE,
  "Deceased": Status.DECEASED,
  "Presumed dead": Status.PRESUMED_DEAD
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap;
    return reverseMap;
  }
}
