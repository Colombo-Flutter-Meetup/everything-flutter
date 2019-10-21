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

//past events
News pasteventsItemone = News(
  title: "Flutter Meetup",
  time: DateTime.parse("2019-05-30T22:49:51.764000+05:30"),
  link:
      "www.example.com",
  image: "https://maps.googleapis.com/maps/api/staticmap?markers=size:tiny|-15.78,-47.91|50.06,19.96|60.17,24.94|1.300,103.8|30.22,-97.75|52.26,21.02|39.69,-104.9|55.58,9.760|38.83,-77.34|53.43,14.53|33.45,-112.1|42.35,-83.06|51.11,17.03|41.89,-87.64|43.65,-79.38|42.69,23.31|48.16,17.13|-37.81,145.0|-27.46,153.0|18.53,73.84|4.630,-74.09|37.56,127.0|3.160,101.7|23.61,58.54|48.14,11.58|49.00,8.400|45.80,15.97|-6.860,109.1|38.96,-77.23|51.24,6.790|52.40,16.90|33.37,6.860|43.17,-77.60|44.44,26.10|58.97,5.710|43.74,-79.36|40.11,-82.91|46.86,-114.0|12.97,77.56|39.75,-105.0|26.47,80.33|-8.080,-34.92|49.84,24.03|51.44,5.470|51.52,-0.1000|-30.04,-51.22|48.36,10.89|26.92,75.80|-22.91,-47.08|42.36,-71.07|43.58,39.74|35.23,-80.84|53.15,8.210|40.04,-105.3|40.75,-73.99|31.22,29.95|-33.93,18.46|36.19,44.02|54.81,56.07|31.33,75.57|34.15,-118.5|14.08,-87.22|59.91,10.75|33.65,-117.8|-27.60,-48.54|50.12,8.680|48.86,2.340|43.62,1.450|-16.50,-68.15|40.78,43.83|-8.580,116.1|54.32,10.12|50.08,14.43|48.22,16.37|49.87,8.640|49.80,9.940|-34.93,138.6|55.71,13.20|38.72,-9.140|48.11,-1.680|53.23,6.570|27.96,-82.46|-34.61,-58.37|-19.92,-43.94|51.77,19.46|39.70,-105.1|36.72,-4.420|35.67,139.8|41.32,-81.55|33.88,35.50|24.65,46.77|6.250,-75.59|44.83,20.50|50.00,8.260|54.36,18.64|22.57,88.36|37.98,23.73|50.88,4.700|-33.87,151.2|49.28,-123.0|6.520,3.300|13.09,80.27|23.03,72.58|51.72,39.26|36.19,5.410|67.29,14.37|53.55,10.00|33.52,-111.9|-31.40,-64.19|41.40,2.170|-1.940,30.06|9.600,6.550|52.37,4.890|51.50,7.630|48.79,9.190|49.45,11.05|-36.85,174.8|59.33,18.07|40.05,-105.2|-31.96,115.8|-7.230,-35.88|53.33,-6.250|14.62,121.0|42.47,-83.40|33.72,73.06|47.51,19.08|47.38,8.540|52.21,0.1300|-12.07,-77.05|50.64,3.070|45.65,-73.50|45.45,-75.69|18.46,-66.11|-6.910,107.6|-23.53,-46.63|32.07,34.77|46.52,6.620|29.72,-95.22|19.43,-99.14|-33.46,-70.64|52.52,13.38|37.35,-122.0&size=600x300&style=feature:administrative%7Cvisibility:off&style=feature:landscape%7Ccolor:0xffffff&style=feature:landscape%7Celement:labels%7Cvisibility:off&style=feature:landscape.man_made%7Celement:geometry%7Ccolor:0xffffff&style=feature:poi%7Cvisibility:off&style=feature:road%7Cvisibility:off&style=feature:transit%7Cvisibility:off&style=feature:water%7Ccolor:0xabd7df&scale=2&zoom=1&key=AIzaSyDmnawK5g8z5vh2itc7Qou7STaVkxocOtU",
  source: Source(name: "READ MORE"),
);


News pasteventItemtwo = News(
  title: "Introduction To Flutter",
  time: DateTime.parse("2019-04-20T22:49:51.764000+05:30"),
  link:
      "www.example.com",
  image: "https://i.ytimg.com/vi/zmBvPcEjetA/maxresdefault.jpg",
  source: Source(name: "READ MORE"),
);


//widgets
News widget1 = News(
  title: "Scaffold",
  time: DateTime.parse("2019-05-30T22:49:51.764000+05:30"),
  link:
      "https://api.flutter.dev/flutter/material/Scaffold-class.html",
  image: "https://i.ytimg.com/vi/vb8YDD7KO00/maxresdefault.jpg",
  source: Source(name: "READ MORE"),
);

News widget2 = News(
  title: "Transform",
  time: DateTime.parse("2019-05-30T22:49:51.764000+05:30"),
  link:
      "https://api.flutter.dev/flutter/widgets/Transform-class.html",
  image: "https://i.ytimg.com/vi/9z_YNlRlWfA/maxresdefault.jpg",
  source: Source(name: "READ MORE"),
);
