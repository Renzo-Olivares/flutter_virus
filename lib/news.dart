import 'package:flutter/material.dart';
import 'headlines/article.dart';
import 'package:animations/animations.dart';

class Headlines extends StatefulWidget {
  Headlines({Key key}) : super(key: key);

  @override
  _HeadlinesState createState() => _HeadlinesState();
}

class _HeadlinesState extends State<Headlines> {
  @override
  Widget build(BuildContext context) {
    final source = [
      "Washington Post",
      "CDC",
      "CNN",
      "The New York Times",
      "WOWT",
      "The Seattle Times",
      "Forbes"
    ];
    final subtitle = [
      "Corona Virus Live Updates",
      "Health Updates",
      "Corona Virus Around the World Live Updates",
      "World Live Updates",
      "Covid-19 updates",
      "Seattle Updates",
      "News Updates"
    ];
    final List<Widget> websites = [
      Articles(
          name:
              "https://www.washingtonpost.com/nation/2020/06/28/coronavirus-live-updates-us/"),
      Articles(
          name:
              "https://www.cdc.gov/media/releases/2020/p0625-update-expands-covid-19.html"),
      Articles(
          name:
              "https://www.cnn.com/world/live-news/coronavirus-pandemic-06-28-20-intl/index.html"),
      Articles(
          name:
              "https://www.nytimes.com/2020/06/28/world/coronavirus-updates.html"),
      Articles(
          name:
              "https://www.wowt.com/content/news/Nebraska-COVID-19-cases-reported-Sunday-June-28-2020-571420591.html"),
      Articles(
          name:
              "https://www.seattletimes.com/seattle-news/health/coronavirus-daily-news-updates-june-28-what-to-know-today-about-covid-19-in-the-seattle-area-washington-state-and-the-world/"),
      Articles(
          name:
              "https://www.forbes.com/sites/kenrapoza/2020/06/28/coronavirus-update-china-gets-healthy-us-gets-sicker-and-europe-wilts/#23e5bb4f4300")
    ];
    final images = [
      Image.asset('assets/images/washington_post.jpg'),
      Image.asset('assets/images/cdc.png'),
      Image.asset('assets/images/cnn.png'),
      Image.asset('assets/images/nyt.png'),
      Image.asset('assets/images/WOWT_6.png'),
      Image.asset('assets/images/seattletimes.jpg'),
      Image.asset('assets/images/Forbes-logo.png'),
    ];
    return ListView.builder(
        itemCount: websites.length,
        itemBuilder: (context, index) {
          return Card(
              child: OpenContainer(
            transitionType: ContainerTransitionType.fadeThrough,
            transitionDuration: Duration(milliseconds: 400),
            openBuilder: (BuildContext context, VoidCallback _) {
              return websites[index];
            },
            closedElevation: 8.0,
            closedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            closedColor: Theme.of(context).accentColor,
            closedBuilder: (BuildContext context, VoidCallback openContainer) {
              return Card(
                child: ListTile(
                  leading:
                      Container(height: 200, width: 50, child: images[index]),
                  title: Text((source[index]),
                      style: Theme.of(context).textTheme.headline6),
                  subtitle: Text(
                    subtitle[index],
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              );
            },
          ));
        });
  }
}
