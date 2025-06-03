// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_app/anakata/widgets/api_banner.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app/anakata/widgets/faq.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xfff5f6f7)),
      home: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          toolbarHeight: 80,
          backgroundColor: const Color(0xfff5f6f7),
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(
              top: 22,
              bottom: 22,
              right: 22,
              left: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset('assets/logo.png', fit: BoxFit.cover, width: 100),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                top: 22,
                bottom: 22,
                right: 22,
                left: 22,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                child: Image.asset('assets/profile.JPG', fit: BoxFit.cover),
              ),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
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
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 22,
                top: 15,
                bottom: 0,
              ),
              child: Text(
                'Upcoming',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Instrument_Sans_Bold',
                  color: const Color(0xff212529),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 0,
                bottom: 0,
              ),
              child: CarouselSlider.builder(
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
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  imgList[idx],
                                  fit: BoxFit.cover,
                                  width: 500.0,
                                ),
                                Container(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 55,
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 0,
                                    bottom: 5,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 15,
                bottom: 0,
              ),
              child: Text(
                'Frequently Asked Question',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Instrument_Sans_Bold',
                  color: const Color(0xff212529),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 10,
                bottom: 0,
              ),
              child: faqList(),
            ),
            Center(
              child: SizedBox(
                width: 200.0, // Button width
                height: 50.0, // Button height
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                  ),
                  onPressed: () {},
                  child: Text('TextButton'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
