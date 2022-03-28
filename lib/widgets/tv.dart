import 'package:flutter/material.dart';
import 'package:fluttermovieapp/utils/text.dart';

class TV extends StatelessWidget {
  final List tvshows;
  const TV({Key? key, required this.tvshows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: "Popular Tv Shows", color: Colors.blue, size: 18),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvshows.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          height: 140,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(13),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                'http://image.tmdb.org/t/p/w500' +
                                    tvshows[index]['poster_path'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: modified_text(
                              text: tvshows[index]['original_name'] != null
                                  ? tvshows[index]['original_name']
                                  : 'Loading...',
                              color: Colors.white,
                              size: 15),
                        ),
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
