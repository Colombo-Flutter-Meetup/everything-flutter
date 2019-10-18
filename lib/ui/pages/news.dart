import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  // final Container appBarDrawer = Container(
  //   height: 15,
  //   width: 10,
  //   child: Row(
  //     children: <Widget>[
  //       Container(
  //         height: 5,
  //         width: 10,
  //         color: Colors.black,
  //       ),
  //       Container(
  //         height: 5,
  //         width: 10,
  //         color: Colors.black,
  //       ),
  //       Container(
  //         height: 5,
  //         width: 10,
  //         color: Colors.black,
  //       )
  //     ],
  //   ),
  // );

//  News newsItem = News(
//    title: "How we built Flutter app presented at MWC'19 in one month",
//    time: DateTime.now().subtract(
//      Duration(minutes: 55),
//      ),
//    image:
//    "https://blog.codemagic.io/uploads/2019/02/CM-Flutter-experience.jpg",
//    source: Source(name: "MEDIUM"),
//    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Sept 8, 2019",
                        style: TextStyle(
                          color: Color(0xFF545454),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                  ),
                  Positioned(
                    child: Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Color(0xFFFD987C),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.network(
                            "https://blog.codemagic.io/uploads/2019/02/CM-Flutter-experience.jpg",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Positioned(
                    top: 280,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 8.0, 16.0, 4.0),
                              child: Text(
                                "How we built Flutter app presented at MWC'19 in one month",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 12.0, 16.0, 4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "MEDIUM",
                                    style: TextStyle(
                                      color: Color(0xFF40ACF9),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "${DateFormat("MMMM d, yyyy").format(DateTime.parse("2019-06-30T22:49:51.764000+05:30"))}",
                                    style: TextStyle(
                                      color: Color(0xFF545454),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 16.0, 4.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "One developer, one month and one Flutter app in production. This is the story of building a Flutter production app in just one month with no prior experience in Flutter or Dart and launching it at Mobile World Congress 2019 in Barcelona.",
                                    style: TextStyle(
                                      color: Color(0xFF545454),
                                      fontSize: 16,
                                      letterSpacing: 0.3,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                      "Some might say it’s crazy, but we say it’s the power of Flutter, a mobile SDK by Google that allows you to build native Android and iOS applications from a single code base. This is the Flutter diary from the perspective of a software engineer at Nevercode. From day one and picking up Flutter to the beautiful native-looking apps in Google Play Store and Apple App Store.",
                                      style: TextStyle(
                                        color: Color(0xFF545454),
                                        fontSize: 16,
                                        letterSpacing: 0.3,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.justify),
                                  SizedBox(height: 25),
                                  Text(
                                      "On December 4th at the Flutter Live event held in London, Google announced the release of Flutter 1.0, an open-source mobile toolkit for building native Android and iOS applications from a single code base. At the same event, Nevercode launched its dedicated continuous integration and delivery (CI/CD) tool for Flutter applications named Codemagic.",
                                      style: TextStyle(
                                        color: Color(0xFF545454),
                                        fontSize: 16,
                                        letterSpacing: 0.3,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      textAlign: TextAlign.justify)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Positioned(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(
//                                   16.0, 4.0, 16.0, 4.0),
//                               child: Text(
//                                 "Amber Rudd quits government over Johnson's Brexit stance",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(
//                                   16.0, 4.0, 16.0, 4.0),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: <Widget>[
//                                   Text(
//                                     "GOVERMENT",
//                                     style: TextStyle(
//                                       color: Color(0xFF40ACF9),
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w300,
//                                     ),
//                                   ),
//                                   Text(
//                                     "September 7th, 2019",
//                                     style: TextStyle(
//                                       color: Color(0xFF545454),
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w300,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(
//                                   16.0, 16.0, 16.0, 4.0),
//                               child: Column(
//                                 children: <Widget>[
//                                   Text(
//                                     "Amber Rudd has quit the cabinet and surrendered the Conservative whip saying she cannot stand by while moderate Conservatives are expelled. The work and pensions secretary said she no longer believed leaving the EU with a deal was the government's main objective. ",
//                                   ),
//                                   SizedBox(height: 10),
//                                   Text(
//                                       "Ms Rudd described the sacking of 21 Tory MPs on Tuesday as an assault on decency and democracy. No 10 said it was disappointed by the resignation of a talented minister.But a spokesperson added that all ministers who joined the Cabinet signed up to leaving the EU on 31 October come what may.")
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
