import 'dart:convert';

class Event {
  String id;
  String name;
  String venue;
  String organizer;
  DateTime date;
  String time;
  String description;
  String registrationLink;
  String banner;

  Event({
    this.id,
    this.name,
    this.venue,
    this.organizer,
    this.date,
    this.time,
    this.description,
    this.registrationLink,
    this.banner,
  });

  factory Event.fromJson(String str) => Event.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Event.fromMap(Map<String, dynamic> json) => new Event(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        venue: json["venue"] == null ? null : json["venue"],
        organizer: json["organizer"] == null ? null : json["organizer"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"] == null ? null : json["time"],
        description: json["description"] == null ? null : json["description"],
        registrationLink:
            json["registrationLink"] == null ? null : json["registrationLink"],
        banner: json["banner"] == null ? null : json["banner"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "venue": venue == null ? null : venue,
        "organizer": organizer == null ? null : organizer,
        "date": date == null
            ? null
            : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time == null ? null : time,
        "description": description == null ? null : description,
        "registrationLink": registrationLink == null ? null : registrationLink,
        "banner": banner == null ? null : banner,
      };
}
