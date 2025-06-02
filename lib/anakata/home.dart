// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_app/anakata/widgets/api_banner.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
              items: imageSliders,
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
                  fontSize: 19,
                  fontFamily: 'Instrument_Sans_Bold',
                  color: const Color(0xff212529),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 22,
                right: 22,
                top: 0,
                bottom: 0,
              ),
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: false,
                  viewportFraction: 1,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
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
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.network(imgList[idx], fit: BoxFit.cover),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
