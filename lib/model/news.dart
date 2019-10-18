import 'dart:convert';

class NewsList {
  List<News> data;

  NewsList({
    this.data,
  });

  factory NewsList.fromJson(String str) => NewsList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsList.fromMap(Map<String, dynamic> json) => NewsList(
        data: json["news"] == null
            ? null
            : List<News>.from(json["news"].map((x) => News.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "news": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class News {
  String title;
  DateTime time;
  String link;
  Source source;
  String image;

  News({
    this.title,
    this.time,
    this.link,
    this.source,
    this.image,
  });

  factory News.fromJson(String str) => News.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory News.fromMap(Map<String, dynamic> json) => News(
        title: json["title"] == null ? null : json["title"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        link: json["link"] == null ? null : json["link"],
        source: json["source"] == null ? null : Source.fromMap(json["source"]),
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toMap() => {
        "title": title == null ? null : title,
        "time": time == null ? null : time.toIso8601String(),
        "link": link == null ? null : link,
        "source": source == null ? null : source.toMap(),
        "image": image == null ? null : image,
      };
}

class Source {
  String name;
  String logo;

  Source({
    this.name,
    this.logo,
  });

  factory Source.fromJson(String str) => Source.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Source.fromMap(Map<String, dynamic> json) => Source(
        name: json["name"] == null ? null : json["name"],
        logo: json["logo"] == null ? null : json["logo"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "logo": logo == null ? null : logo,
      };
}
