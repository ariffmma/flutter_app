import 'package:flutter/material.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://anakataseries.com/images/event/1745805564.a_19.jpg',
  'https://anakataseries.com/frontend-as/assets/photo_event/DSC04572.jpg',
  'https://anakataseries.com/images/event/1745805564.a_19.jpg',
  'https://anakataseries.com/frontend-as/assets/photo_event/ANA00834.jpg',
  'https://anakataseries.com/frontend-as/assets/photo_event/DSC02600.jpg',
  'https://anakataseries.com/frontend-as/assets/photo_event/DSC02600.jpg',
];

final List<Widget> imageBanner = imgList
    .map(
      (item) => Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: 500.0,
                  height: 500,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 30,
                      right: 30,
                      left: 30,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Design Series Palembang',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '20/06/2025',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 194, 194, 194),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
    .toList();

class top_banner extends StatefulWidget {
  const top_banner({super.key});

  @override
  State<top_banner> createState() => _top_bannerState();
}

class _top_bannerState extends State<top_banner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enableInfiniteScroll: true,
              viewportFraction: 0.9,
              aspectRatio: 2 / 1,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              enlargeFactor: 0.3,
              autoPlayInterval: Duration(seconds: 8),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            items: imageBanner,
          ),
        ),
      ],
    );
  }
}
