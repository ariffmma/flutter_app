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

class slider_upcoming extends StatefulWidget {
  const slider_upcoming({super.key});

  @override
  State<slider_upcoming> createState() => _slider_upcomingState();
}

class _slider_upcomingState extends State<slider_upcoming> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 0),
      child: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              aspectRatio: 2,
              enlargeCenterPage: false,
              viewportFraction: 1,
            ),
            itemCount: (imgList.length / 2).round(),
            itemBuilder: (context, index, realIdx) {
              final int first = index * 2;
              final int second = first + 1;
              return Row(
                children: [first, second].map((idx) {
                  return Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(imgList[idx], fit: BoxFit.cover),
                            Container(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 0,
                                bottom: 5,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hospital Series Palembang',
                                    style: TextStyle(
                                      fontFamily: 'Instrument_Sans_Regular',
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '19 June 2025',
                                    style: TextStyle(
                                      fontFamily: 'Instrument_Sans_Regular',
                                      color: Colors.black38,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
