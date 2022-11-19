import 'dart:convert';

List<AllGameModel> allGameModelFromJson(String str) => List<AllGameModel>.from(
    json.decode(str).map((x) => AllGameModel.fromJson(x)));

String allGameModelToJson(List<AllGameModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllGameModel {
  AllGameModel({
    required this.gameName,
    required this.gameUrl,
    required this.logo,
    required this.category,
  });

  String gameName;
  String gameUrl;
  String logo;
  String category;

  factory AllGameModel.fromJson(Map<String, dynamic> json) => AllGameModel(
        gameName: json["GameName"],
        gameUrl: json["GameURL"],
        logo: json["Logo"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "GameName": gameName,
        "GameURL": gameUrl,
        "Logo": logo,
        "category": category,
      };
}
