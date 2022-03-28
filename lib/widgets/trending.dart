import 'package:flutter/material.dart';
import 'package:fluttermovieapp/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Trending Movies", color: Colors.blue, size: 18),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
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
                                          trending[index]['poster_path']))),
                        ),
                        Container(
                          child: modified_text(
                              text: trending[index]['title'] != null
                                  ? trending[index]['title']
                                  : 'Loading...',
                              color: Colors.white,
                              size: 15),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
