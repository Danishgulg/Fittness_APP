import 'dart:async';
import 'package:fit_now/home_cycling_tracking_module/widget/map_data_described_cotainer.dart';
import 'package:fit_now/home_cycling_tracking_module/widget/map_icon_button.dart';
import 'package:fit_now/home_item/widget/description_text_widget.dart';
import 'package:fit_now/step_tracking_running_module/widget/start_running_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_places_flutter/google_places_flutter.dart';

class CyclingTrackingPage extends StatefulWidget {
  const CyclingTrackingPage({super.key});

  @override
  State<CyclingTrackingPage> createState() => _CyclingTrackingPageState();
}

class _CyclingTrackingPageState extends State<CyclingTrackingPage> {
  final Completer completer = Completer<GoogleMapController>();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destinationLocation = LatLng(37.33429383, -122.06600055);

  List<LatLng> polypointsList = [];

  final String _mapGoogleApiKey = 'AIzaSyAdc9zb7AJVdr1FU37cq56A6RlukDHppCE';

  late final TextEditingController textEditingController =
      TextEditingController();

  late GoogleMapController googleMapController;

  bool isPiPDragging = false;
  double piPPositionX = 0.0;
  double piPPositionY = 0.0;

  @override
  void initState() {
    super.initState();
    getLocation();
    getPolyPoints();
  }

  void getPolyPoints() async {
    PolylinePoints polyPoints = PolylinePoints();

    PolylineResult result = await polyPoints.getRouteBetweenCoordinates(
        _mapGoogleApiKey,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(
            destinationLocation.latitude, destinationLocation.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((element) {
        polypointsList.add(LatLng(element.latitude, element.longitude));
      });
      setState(() {});
      if (mounted) {
        return;
      }
    }
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              SizedBox(
                width: screenWidth,
                height: screenHeight,

                //map for showing navigation
                child: GoogleMap(
                  mapType: MapType.normal,
                  zoomControlsEnabled: true,
                  compassEnabled: false,
                  zoomGesturesEnabled: true,
                  initialCameraPosition: const CameraPosition(
                      target: sourceLocation,
                      zoom: 30.0,
                      bearing: 270.0,
                      tilt: 90.0),
                  markers: {
                    const Marker(
                        markerId: MarkerId('source'), position: sourceLocation),
                    const Marker(
                        markerId: MarkerId('destination'),
                        position: destinationLocation),
                  },
                  polylines: {
                    Polyline(
                        polylineId: const PolylineId("route"),
                        color: Colors.blue,
                        points: polypointsList,
                        width: 30)
                  },
                  onMapCreated: (controller) {
                    completer.complete(controller);
                  },
                ),
              ),
              Positioned(
                left: piPPositionX,
                top: piPPositionY,
                child: GestureDetector(
                  onPanStart: (details) {
                    setState(() {
                      isPiPDragging = true;
                    });
                  },
                  onPanUpdate: (details) {
                    if (isPiPDragging) {
                      setState(() {
                        piPPositionX += details.delta.dx;
                        piPPositionY += details.delta.dy;
                      });
                    }
                  },
                  onPanEnd: (details) {
                    setState(() {
                      isPiPDragging = false;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.05,
                        top: screenHeight * 0.05),
                    child: Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey.withOpacity(0.8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.05),
                            child: const DescriptionText(
                              text: 'state',
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const MapDataDescribeContainer(
                                time: '212',
                                unit: 'sad',
                                type: 'Distance',
                              ),
                              SizedBox(
                                width: screenWidth * 0.02,
                              ),
                              const MapDataDescribeContainer(
                                time: '212',
                                unit: 'sad',
                                type: 'time',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ProgressMaterialButton(
                                event: () {},
                                text: FittedBox(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.av_timer_outlined,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.01,
                                      ),
                                      Text(
                                        'Resume',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.04),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              ProgressMaterialButton(
                                event: () {},
                                text: FittedBox(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.stop_circle_outlined,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.01,
                                      ),
                                      Text(
                                        'stop',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.04),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.5,
                ),
                child: Column(
                  children: [
                    MapIconButton(
                        icon: Icon(Icons.layers_sharp,
                            size: screenWidth * 0.08,
                            color: const Color.fromARGB(255, 4, 35, 61)),
                        event: () {}),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    MapIconButton(
                        icon: Icon(Icons.location_on_sharp,
                            size: screenWidth * 0.08, color: Colors.red),
                        event: () async {}),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.05),
                child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: StartRunningButton(isCount: false)),
              ),

            ],
          ),
        ),
      ),
    );
  }

  // helping function which determine the willpopscope

  Future<bool> _onBackPressed() async {
    final shouldExit = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 4, 35, 61),
        title: const Text(
          'Confirm Exit',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Are you sure you want to exit the app?',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );

    return shouldExit ?? false;
  }

  static const LocationSettings _locationSettings = LocationSettings(
    accuracy: LocationAccuracy.bestForNavigation,
  );

  void getLocation() async {
    if (await Permission.location.isGranted) {
      getCuurrentLocation();
    } else {
      await Permission.location.request();
      getCuurrentLocation();
    }
  }

  void getCuurrentLocation() async {
    googleMapController = await completer.future;

    try {
      Geolocator.getPositionStream(locationSettings: _locationSettings)
          .listen((position) {
        if (mounted) {
          googleMapController
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                  target: LatLng(
                    position.altitude,
                    position.longitude,
                  ),
                  zoom: 30.0)));
          print("Lat : ${position.altitude} Long : ${position.longitude}");
          setState(() {});
        }
      });
    } on MissingPluginException catch (_) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Location not found')));
    }
  }
}
