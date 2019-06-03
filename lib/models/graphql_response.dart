import 'dart:convert';

import 'package:everything_flutter/models/community.dart';
import 'package:everything_flutter/models/event.dart';
import 'package:everything_flutter/models/news.dart';
import 'package:everything_flutter/models/response_widget.dart';
import 'package:everything_flutter/models/tutorial.dart';

// The starting point of any response received from a GraphQL query

class GraphQLResponse {
  List<News> news;
  List<Event> events;
  List<Tutorial> tutorials;
  List<Community> communities;
  List<ResponseWidget> responseWidgets;

  GraphQLResponse({
    this.news,
    this.events,
    this.tutorials,
    this.communities,
    this.responseWidgets,
  });

  factory GraphQLResponse.fromJson(String str) => GraphQLResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GraphQLResponse.fromMap(Map<String, dynamic> json) => new GraphQLResponse(
        news: json["news"] == null
            ? null
            : new List<News>.from(json["news"].map((x) => News.fromMap(x))),
        events: json["events"] == null
            ? null
            : new List<Event>.from(json["events"].map((x) => Event.fromMap(x))),
        tutorials: json["tutorials"] == null
            ? null
            : new List<Tutorial>.from(
                json["tutorials"].map((x) => Tutorial.fromMap(x))),
        communities: json["communities"] == null
            ? null
            : new List<Community>.from(
                json["communities"].map((x) => Community.fromMap(x))),
        responseWidgets: json["ResponseWidgets"] == null
            ? null
            : new List<ResponseWidget>.from(
                json["ResponseWidgets"].map((x) => ResponseWidget.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "news": news == null
            ? null
            : new List<dynamic>.from(news.map((x) => x.toMap())),
        "events": events == null
            ? null
            : new List<dynamic>.from(events.map((x) => x.toMap())),
        "tutorials": tutorials == null
            ? null
            : new List<dynamic>.from(tutorials.map((x) => x.toMap())),
        "communities": communities == null
            ? null
            : new List<dynamic>.from(communities.map((x) => x.toMap())),
        "ResponseWidgets": responseWidgets == null
            ? null
            : new List<dynamic>.from(responseWidgets.map((x) => x.toMap())),
      };
}

