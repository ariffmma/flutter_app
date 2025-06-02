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
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xfff5f6f7)),
      home: Scaffold(
        appBar: AppBar(
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
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enableInfiniteScroll: true,
                viewportFraction: 0.9,
                aspectRatio: 2 / 1,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                enlargeFactor: 0.3,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: imageBanner,
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
                  aspectRatio: 3,
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
                            child: Stack(
                              children: [
                                Image.network(
                                  imgList[idx],
                                  fit: BoxFit.cover,
                                  width: 500.0,
                                ),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0),
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 20.0,
                                    ),
                                    child: Text(
                                      'Design series',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
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
              child: Column(
                children: [
                  Container(
                    color: const Color(0xfff5f6f7),
                    child: ExpansionTileItem.outlined(
                      title: const Text(
                        'How do I register the event?',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Instrument_Sans_Regular',
                          color: const Color(0xff212529),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      children: [
                        const Text(
                          'You can fill out the form manually or sign up to get access. You should check "my ticket" for barcode access to the event. All events (online and offline) only provide access to post-events within this website.',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Instrument_Sans_Regular',
                            color: const Color(0xff212529),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: const Color(0xfff5f6f7),
                    child: ExpansionTileItem.outlined(
                      title: const Text(
                        'Where is I can my certificate?',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Instrument_Sans_Regular',
                          color: const Color(0xff212529),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      children: [
                        const Text(
                          'All documents related to your participation will be uploaded to your profile. Please check regularly to avoid loss or expiration dates.',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Instrument_Sans_Regular',
                            color: const Color(0xff212529),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
