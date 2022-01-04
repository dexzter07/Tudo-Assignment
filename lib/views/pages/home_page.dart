import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tudo_assignment/configs/constants/app_constants.dart';
import 'package:tudo_assignment/configs/styles/app_colors.dart';
import 'package:tudo_assignment/controller/charaster_list_controller.dart';
import 'package:get/get.dart';
import 'package:tudo_assignment/views/components/character_lists_components.dart';
import 'package:tudo_assignment/views/components/shimmer_effect_components.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CharacterListController _characterListController = Get.put(CharacterListController());
  final Completer<GoogleMapController> _controller = Completer();
  List<Marker> markers = [];
  late bool _isLoading;

  @override
  void initState() {
    initilize();
    _isLoading = true;
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }
  initilize(){
    Marker firstMarker = Marker(
      markerId: const MarkerId('one'),
      position: const LatLng(12.962938, 77.632852),
      infoWindow: const InfoWindow(title: "One"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    Marker secondMarker = Marker(
      markerId: const MarkerId('two'),
      position: const LatLng(12.968165, 77.631801),
      infoWindow: const InfoWindow(title: "two"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    Marker thirdMarker = Marker(
      markerId: const MarkerId('three'),
      position: const LatLng(12.964897, 77.633897),
      infoWindow: const InfoWindow(title: "three"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    Marker fourthMarker = Marker(
      markerId: const MarkerId('one'),
      position: const LatLng(12.966897, 77.633897),
      infoWindow: const InfoWindow(title: "four"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );
    setState(() {
    markers.add(firstMarker);
    markers.add(secondMarker);
    markers.add(thirdMarker);
    markers.add(fourthMarker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tudo Technologies"),
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          elevation: 0,
          bottom: const TabBar(
            labelColor: AppColors.primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: AppColors.primaryColor,
            tabs: [
              Tab(
                  child: Text(
                    "Exercise 1",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
              Tab(
                  child: Text(
                    'Exercise 2',
                    style: TextStyle(
                      color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.screenHorizontalPadding,vertical: AppConstants.screenVerticalPadding),
              child: Align(
                alignment: Alignment.center,
                child: Obx(()=> _characterListController.isLoading.value == true?ListView.separated(
                  itemCount: 5,
                  itemBuilder: (context, index) => const NewsCardSkelton(),
                  separatorBuilder: (context, index) =>
                  const SizedBox(height: 16),
                ):
                ListView.builder(
                    itemCount: _characterListController.characterLists.length ,
                    itemBuilder: (context,index){
                      return CharacterListComponents(
                          lists: _characterListController
                              .characterLists[index]);
                    })
                ),
              ),
            ),
            _isLoading
                ? ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) => const NewsCardSkelton(),
              separatorBuilder: (context, index) =>
              const SizedBox(height: 16),
            )
                :
            SizedBox(
              width: double.infinity,
              child: GoogleMap(
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                  Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer(),),
                },
                markers: markers.map((e) => e).toSet(),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                initialCameraPosition: const CameraPosition(
                  target: LatLng(12.9610,77.6387),
                  zoom: 15,

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Skeleton(height: 120, width: 120),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skeleton(width: 80),
              const SizedBox(height: 16 / 2),
              const Skeleton(),
              const SizedBox(height: 16 / 2),
              const Skeleton(),
              const SizedBox(height: 16 / 2),
              Row(
                children: const [
                  Expanded(
                    child: Skeleton(),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Skeleton(),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}