
import 'dart:convert';

class Community {
  String id;
  String name;
  String description;
  String ircLink;
  String communityLink;

  Community({
    this.id,
    this.name,
    this.description,
    this.ircLink,
    this.communityLink,
  });

  factory Community.fromJson(String str) => Community.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Community.fromMap(Map<String, dynamic> json) => new Community(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        ircLink: json["ircLink"] == null ? null : json["ircLink"],
        communityLink:
            json["communityLink"] == null ? null : json["communityLink"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "ircLink": ircLink == null ? null : ircLink,
        "communityLink": communityLink == null ? null : communityLink,
      };
}