import 'package:everything_flutter/model/news.dart';

News newsItem = News(
  title: "How we built Flutter app presented at MWC'19 in one month",
  time: DateTime.now().subtract(
    Duration(minutes: 55),
  ),
  image: "https://blog.codemagic.io/uploads/2019/02/CM-Flutter-experience.jpg",
  source: Source(name: "MEDIUM"),
);

News newsItemTwo = News(
  title: "A Lookback Into Flutter 1.5 – The Biggest Google Release of 2019",
  time: DateTime.parse("2019-06-30T22:45:52.326000+05:30"),
  image: "https://cdn.iconicto.com/EverythingFlutter/media/News/ef1.png",
  link: "https://appinventiv.com/blog/flutter-1-5-highlights/",
  source: Source(name: "Appinventiv"),
);

News newsItemThree = News(
  title: "Google’s Flutter framework spreads its wings and goes multi-platform",
  time: DateTime.parse("2019-06-30T22:49:51.764000+05:30"),
  link:
      "https://techcrunch.com/2019/05/07/googles-flutter-framework-spreads-its-wings-and-goes-multi-platform/",
  image: "https://cdn.iconicto.com/EverythingFlutter/media/News/ef3.jpg",
  source: Source(name: "Techcrunch"),
);
