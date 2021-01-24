import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spotadate/core/constants/colors.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  bool isShowMoreDetails = false;
  Completer<GoogleMapController> _completer = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  _onMapCreated(GoogleMapController controller) {
    _completer.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),

          /// Choose location on map
          ///
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                FlatButton(
                  child: Text(
                    'Choose a place',
                    style: TextStyle(
                        color: appBarGreyColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                    setState(() {
                      _markers.add(
                        Marker(
                            markerId: MarkerId(_lastMapPosition.toString()),
                            position: _lastMapPosition,
                            infoWindow: InfoWindow(title: 'Portland'),
                            icon: BitmapDescriptor.defaultMarker),
                      );
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: orangeColor,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: isShowMoreDetails
                ?

                /// show More details area ... in bottom
                ///
                showMoreDetails()
                :

                /// show less details area ... in bottom
                ///
                showLessDetails(),
          )
        ],
      ),
    );
  }

  Widget showLessDetails() {
    return Container(
      height: 120,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cosa Nostra',
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  Image.asset('assets/images/image_slider/distance.png'),
                  Text(
                    '2 km',
                    style: TextStyle(fontSize: 8),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
          Row(children: [
            Text(
              '5.0 ',
              style: TextStyle(fontSize: 7),
            ),
            Icon(
              Icons.star,
              color: yellowColor,
              size: 10,
            ),
            Icon(
              Icons.star,
              color: yellowColor,
              size: 10,
            ),
            Icon(
              Icons.star,
              color: yellowColor,
              size: 10,
            ),
            Icon(
              Icons.star,
              color: yellowColor,
              size: 10,
            ),
            Icon(
              Icons.star,
              color: yellowColor,
              size: 10,
            ),
          ]),
          SizedBox(
            height: 2,
          ),
          Text(
            'Open | Closes 12:00 AM',
            style: TextStyle(fontSize: 7),
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isShowMoreDetails =
                          isShowMoreDetails == false ? true : false;
                    });
                  },
                  child: Text(
                    'view more details',
                    style: TextStyle(color: orangeColor, fontSize: 10),
                  )),
              Container(
                height: 25,
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(
                  color: orangeColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                    child: Text(
                  'Select',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget showMoreDetails() {
    return Material(
      elevation: 15.0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.46,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// Above Row area having [Name, Rating, Select Button]...
                  ///
                  Row(children: [
                    Image.asset('assets/images/map_details/brewdog.png'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Brewdog',
                                  style: TextStyle(fontSize: 20),
                                ),

                                /// Rating row
                                ///
                                Row(
                                  children: [
                                    Text(
                                      '5.0 ',
                                      style: TextStyle(fontSize: 7),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                      size: 10,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: yellowColor,
                                      size: 10,
                                    ),
                                  ],
                                ),
                                Text(
                                  'Open | Closes 12:00 AM',
                                  style: TextStyle(fontSize: 7),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.6,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Image.asset(
                                      'assets/images/image_slider/distance.png'),
                                ),
                                Text(
                                  '\n\t2 km',
                                  style: TextStyle(fontSize: 8),
                                ),
                              ],
                            ),
                          ],
                        ),

                        /// Show less details Row....
                        ///
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isShowMoreDetails =
                                        isShowMoreDetails == false
                                            ? true
                                            : false;
                                  });
                                },
                                child: Text(
                                  'view less details',
                                  style: TextStyle(
                                      color: orangeColor, fontSize: 10),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4.1,
                            ),
                            Container(
                              height: 25,
                              width: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                color: orangeColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                  child: Text(
                                'Select',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Our latest UK BrewDog Bar is ready and waiting at 316 Midsummer Boulevard, Milton Keynes MK9 2EA – less '
                    'than a ten minute walk north-east from MK Station. If you are hitting the many shops of the town centre '
                    'then we have just unleashed the perfect pit-stop location for you to refuel and then head back into the '
                    'throngs of Centre:MK just up the road. We couldn’t have found a better location for those needing to refuel!',
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Image.asset(
                          'assets/images/map_details/download_menu.png'),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Download Menu',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            ),

            /// Horizontal List view area ....
            ///
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                      'assets/images/map_details/horizontal_view_image1.png'),
                  SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                      'assets/images/map_details/horizontal_view_image2.png'),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
