import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/widgets/destination_carousel.dart';
import 'package:travel_app/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedindex = 0;
  int _currenTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedindex = index;
        });
      },
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: _selectedindex == index
                ? Theme.of(context).accentColor
                : Color(0XFFE7EBEE),
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          _icons[index],
          color: _selectedindex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 100),
              child: Text(
                "What you would like to find?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((map) => _buildIcon(map.key))
                  .toList(),
            ),
            SizedBox(height: 20.0),
            DestinationCarousel(),
            SizedBox(height: 20.0),
            HotelCarousel()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currenTab,
        onTap: (value) {
          setState(() {
            _currenTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza,
              size: 30.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage(
                  'https://cdn.psychologytoday.com/sites/default/files/styles/image-article_inline_full/public/field_blog_entry_images/2018-09/utterstock_648907024.jpg?itok=ji6Xj8tv'),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
