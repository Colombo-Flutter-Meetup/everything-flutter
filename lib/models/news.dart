import 'dart:convert';

import 'package:everything_flutter/models/source.dart';

class News {
  String id;
  String title;
  DateTime time;
  String link;
  Source source;
  String image;

  News({
    this.id,
    this.title,
    this.time,
    this.link,
    this.source,
    this.image,
  });

  factory News.fromJson(String str) => News.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory News.fromMap(Map<String, dynamic> json) => new News(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        link: json["link"] == null ? null : json["link"],
        source: json["source"] == null ? null : Source.fromMap(json["source"]),
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "time": time == null ? null : time.toIso8601String(),
        "link": link == null ? null : link,
        "source": source == null ? null : source.toMap(),
        "image": image == null ? null : image,
      };
}



