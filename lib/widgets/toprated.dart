import 'package:flutter/material.dart';
import 'package:fluttermovieapp/screens/description.dart';
import 'package:fluttermovieapp/utils/text.dart';

class TopRated extends StatelessWidget {
  final List toprated;
  const TopRated({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "TopRated Movies", color: Colors.blue, size: 18),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: toprated[index]['title'],
                          description: toprated[index]['overview'],
                          bannerurl: 'http://image.tmdb.org/t/p/w500' +
                              toprated[index]['backdrop_path'],
                          posterurl: 'http://image.tmdb.org/t/p/w500' +
                              toprated[index]['poster_path'],
                          vote: toprated[index]['vote_average'].toString(),
                          launch_on: toprated[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: toprated[index]['title'] != null
                      ? Container(
                          width: 140,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(13),
                                    ),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'http://image.tmdb.org/t/p/w500' +
                                                toprated[index]
                                                    ['poster_path']))),
                              ),
                              Container(
                                child: modified_text(
                                    text: toprated[index]['title'] != null
                                        ? toprated[index]['title']
                                        : 'Loading...',
                                    color: Colors.white,
                                    size: 15),
                              )
                            ],
                          ),
                        )
                      : Container(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
