
import 'dart:convert';

class Source {
  String id;
  String name;
  String logo;

  Source({
    this.id,
    this.name,
    this.logo,
  });

  factory Source.fromJson(String str) => Source.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Source.fromMap(Map<String, dynamic> json) => new Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        logo: json["logo"] == null ? null : json["logo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "logo": logo == null ? null : logo,
      };
}