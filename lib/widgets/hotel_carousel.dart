import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/models/hotel_model.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Exclusive Hotels",
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => print('see all'),
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.00,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 250,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return Container(
                margin: EdgeInsets.all(10.0),
                width: 350.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: 350.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0),
                          ]),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              width: 350.0,
                              image: AssetImage(hotel.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            child: Container(
                              height: 65.0,
                              width: 350.0,
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      hotel.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30.0,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.locationArrow,
                                          size: 10.0,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          hotel.address,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
