import 'package:flutter/material.dart';

void main() => runApp(const CardSliderApp());

class CardSliderApp extends StatelessWidget {
  const CardSliderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Card Slider')),
        body: const CardSlider(),
      ),
    );
  }
}

class CardSlider extends StatefulWidget {
  const CardSlider({super.key});
  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.5);
  int _currentPage = 1;

  final List<CardData> _cards = [
    CardData(
      imageUrl:
          'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
      title: 'Card 1',
      description: 'Description for Card 1',
    ),
    CardData(
      imageUrl:
          'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
      title: 'Card 2',
      description: 'Description for Card 2',
    ),
    CardData(
      imageUrl:
          'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg',
      title: 'Card 3',
      description: 'Description for Card 3',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          final card = _cards[index];
          final scale = _currentPage == index ? 1.0 : 1.0;

          return TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 300),
            tween: Tween(begin: scale, end: scale),
            curve: Curves.ease,
            builder: (context, value, child) {
              return Transform.scale(scale: value, child: child);
            },
            child: Container(
              // Added a Container for margin
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ), // Added horizontal margin
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.network(card.imageUrl, fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            card.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            card.description,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CardData {
  final String imageUrl;
  final String title;
  final String description;

  CardData({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}
