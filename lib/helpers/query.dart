class Query {

  // Receiving a list of news (View models/news.dart)
  String news = r"""query {
      news{
        id
        title
        time
        link
        source{
          id
          name
          logo
        }
        image
      }
    }
  """;

  // Receiving a list of events (View models/event.dart)
  String events = r"""query {
      events{
        id
        name
        venue
        organizer
        date
        time
        description
        registrationLink
        banner
      }
    }
  """;

  // Receiving a list of tutorials (View models/tutorial.dart)
  String tutorials = r"""query {
      tutorials{
        id
        title
        author
        publishedDate
        link
        source{
          id
          name
          logo
        }
      }
    }
  """;

  // Receiving a list of communities (View models/community.dart)
  String communities = r"""query {
      communities{
        id
        name
        description
        ircLink
        communityLink
      }
    }
  """;

  // Receiving a list of widgets for #WidgetOfTheDay (View models/response_widget.dart)
  String widgets = r"""query {
        widgets{
          id
          name
          description
          image
          link
        }
    }
  """;
}
