import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/models/activity_model.dart';
import 'package:travel_app/models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  DestinationScreen({Key key, this.destination}) : super(key: key);

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRating(int raiting) {
    String text = '';
    for (int i = 0; i <= raiting; i++) {
      text += '⭐';
    }
    return Text(text);
  }

  @override
  Widget build(BuildContext context) {
    final double fullWSize = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: fullWSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40.0,
                  horizontal: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                      iconSize: 30.0,
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () => print('search'),
                          iconSize: 30.0,
                        ),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.sortAmountDown),
                          onPressed: () => print('configs'),
                          iconSize: 25.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.destination.city,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 35.0,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 15.0,
                          color: Colors.white70,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          widget.destination.country,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 30.0,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context, int index) {
                Activity activity = widget.destination.activities[index];
                return Stack(
                  children: [
                    Container(
                      height: 170.0,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 150.0,
                                  child: Text(
                                    activity.name,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\$${activity.price}',
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'per pax',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Text(
                              activity.type,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            _buildRating(activity.rating),
                            SizedBox(height: 10.0),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    activity.startTimes[0],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                SizedBox(width: 5.0),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    activity.startTimes[1],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          width: 100.0,
                          image: AssetImage(activity.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
