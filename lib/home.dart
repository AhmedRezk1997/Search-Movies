import 'package:flutter/material.dart';
import 'package:search_app/model/filmmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List mainlist = [
    movie(
        "The Dark Knight Returns,Part 1",
        2012,
        "https://m.media-amazon.com/images/M/MV5BMzIxMDkxNDM2M15BMl5BanBnXkFtZTcwMDA5ODY1OQ@@._V1_SX300.jpg",
        9.0,
        "https://www.imdb.com/video/vi350594329/?playlistId=tt2313197&ref_=tt_ov_vi"),
    movie(
        "The Dark Knight Returns, Part 2",
        2013,
        "https://m.media-amazon.com/images/M/MV5BYTEzMmE0ZDYtYWNmYi00ZWM4LWJjOTUtYTE0ZmQyYWM3ZjA0XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg",
        8.8,
        "https://www.imdb.com/video/vi350594329/?playlistId=tt2313197&ref_=tt_ov_vi"),
    movie(
        " Dawn of Justice Ultimate Edition",
        2016,
        "https://m.media-amazon.com/images/M/MV5BYzgyMTMzZjUtNGNjMy00NTJjLWIzNDYtMTc2YzQwOGE5MGM4XkEyXkFqcGdeQXVyMTUwODYzMjcw._V1_SX300.jpg",
        9.6,
        "https://www.imdb.com/video/vi3567698457/?playlistId=tt18689424&ref_=tt_ov_vi"),
    movie(
        "Mask of the Phantasm",
        1993,
        "https://m.media-amazon.com/images/M/MV5BYTRiMWM3MGItNjAxZC00M2E3LThhODgtM2QwOGNmZGU4OWZhXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_SX300.jpg",
        9.2,
        "https://www.imdb.com/video/vi599327001/?playlistId=tt0106364&ref_=tt_pr_ov_vi"),
    movie(
        "The Killing Joke",
        2016,
        "https://m.media-amazon.com/images/M/MV5BMTdjZTliODYtNWExMi00NjQ1LWIzN2MtN2Q5NTg5NTk3NzliL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg",
        9.3,
        "https://www.imdb.com/video/vi2610410521/?playlistId=tt4853102&ref_=tt_ov_vi"),
    movie(
        "Batman",
        1966,
        "https://m.media-amazon.com/images/M/MV5BODVjNjdlYTQtMWIwYy00MWIyLWI2ZmMtZWFhMTdjNjAzNGVlXkEyXkFqcGdeQXVyNTAyNDQ2NjI@._V1_SX300.jpg",
        9.7,
        "https://www.imdb.com/video/vi3215114777/?playlistId=tt1877830&ref_=tt_pr_ov_vi"),
    movie(
        "Gotham Knight",
        2008,
        "https://m.media-amazon.com/images/M/MV5BM2I0YTFjOTUtMWYzNC00ZTgyLTk2NWEtMmE3N2VlYjEwN2JlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg",
        9.2,
        "https://www.imdb.com/video/vi548995353/?playlistId=tt1117563&ref_=tt_pr_ov_vi"),
    movie(
        "The Godfather",
        2016,
        "https://i.ytimg.com/vi/zZ9NbRSlBUY/hqdefault.jpg",
        9.3,
        "https://www.imdb.com/video/vi1348706585/?playlistId=tt0068646&ref_=tt_pr_ov_vi"),
  ];

  List displayilst = List.from(mainlist);

  void Updatedata(String val) {
    setState(() {
      displayilst = mainlist
          .where((element) =>
              element.filmtitle!.toLowerCase().contains(val.toLowerCase()))
          .toList();
    });
  }

  _launchUrl(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
    )) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Text("Search Films"),
        backgroundColor: Colors.teal[300],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search your movie",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (val) => Updatedata(val),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.teal[400],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg:prison break",
                suffixIcon: Icon(Icons.search),
                suffixIconColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: displayilst.length == 0
                  ? Center(
                      child: Text(
                        "No Result Found",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayilst.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () => _launchUrl(displayilst[index].Url),
                        contentPadding: EdgeInsets.all(0.9),
                        title: Text(
                          displayilst[index].filmtitle!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        subtitle: Text(
                          "${displayilst[index].filmyear!}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black26),
                        ),
                        trailing: Column(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellowAccent,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "${displayilst[index].rating!}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black26),
                            ),
                          ],
                        ),
                        leading: Image.network(displayilst[index].posterurl!),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
