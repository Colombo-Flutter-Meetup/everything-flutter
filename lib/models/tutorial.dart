import 'dart:convert';

import 'package:everything_flutter/models/source.dart';

class Tutorial {
  String id;
  String title;
  String author;
  DateTime publishedDate;
  String link;
  Source source;

  Tutorial({
    this.id,
    this.title,
    this.author,
    this.publishedDate,
    this.link,
    this.source,
  });

  factory Tutorial.fromJson(String str) => Tutorial.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tutorial.fromMap(Map<String, dynamic> json) => new Tutorial(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        author: json["author"] == null ? null : json["author"],
        publishedDate: json["publishedDate"] == null
            ? null
            : DateTime.parse(json["publishedDate"]),
        link: json["link"] == null ? null : json["link"],
        source: json["source"] == null ? null : Source.fromMap(json["source"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "author": author == null ? null : author,
        "publishedDate": publishedDate == null
            ? null
            : "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
        "link": link == null ? null : link,
        "source": source == null ? null : source.toMap(),
      };
}
