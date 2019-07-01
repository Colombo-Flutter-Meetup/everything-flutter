import 'dart:convert';

// Retrieves a list of widgets from the backend.
class ResponseWidget {
  String id;
  String name;
  String description;
  String image;
  String link;

  ResponseWidget({
    this.id,
    this.name,
    this.description,
    this.image,
    this.link,
  });

  factory ResponseWidget.fromJson(String str) =>
      ResponseWidget.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseWidget.fromMap(Map<String, dynamic> json) =>
      new ResponseWidget(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : json["image"],
        link: json["link"] == null ? null : json["link"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "image": image == null ? null : image,
        "link": link == null ? null : link,
      };
}
