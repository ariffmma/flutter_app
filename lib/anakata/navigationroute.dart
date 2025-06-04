import 'package:flutter/material.dart';
import 'package:flutter_app/anakata/page/dsignbit.dart';
import 'package:flutter_app/anakata/page/homepage.dart';
import 'package:flutter_app/anakata/page/tickets.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(const navigationroute());

class navigationroute extends StatelessWidget {
  const navigationroute({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    homePage(),
    artikel(),
    upcoming(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff5f6f7),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 5),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              child: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.article), label: ''),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.confirmation_number),
                    label: '',
                  ),
                ],
                currentIndex: _selectedIndex,
                unselectedItemColor: Colors.black54,
                selectedItemColor: Colors.black,
                onTap: _onItemTapped,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: TextStyle(fontSize: 0),
                unselectedLabelStyle: TextStyle(fontSize: 0),
                selectedFontSize: 0,
                showUnselectedLabels: false,
                showSelectedLabels: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
