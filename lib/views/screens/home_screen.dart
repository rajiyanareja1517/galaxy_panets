import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galaxy_planets/constants/constants.dart';
import 'package:galaxy_planets/models/planets_des_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../custom_class/custom_class.dart';
import '../../utils/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  late AnimationController _marsHeightAnimationController;
  late Animation<double> _earthAnimation;
  late Animation<double> _earthReverseAnimation;

  late Animation<double> _earthOpacityAnimation;
  List<PlanetsDesModel> planetValues = [];
  late Future<String> jsonData;
  double customHeight = 0.0;
  double customWidth = 0.0;
  double backShiningHeight = 400.0;
  double backShiningInitialHeight = 400.0;
  double backShiningFinalHeight = 150.0;
  late Animation sizeAnimation;
  late Animation rotetionAnimation;
  late AnimationController animationController;

  void loadJson() {
    jsonData = rootBundle.loadString("assets/json_file/planets.json");
  }

  @override
  void initState() {
    super.initState();
    loadJson();
    animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 15),
        lowerBound: 0,
        upperBound: 1);
    _marsHeightAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    backShiningHeight = Tween<double>(
            begin: backShiningInitialHeight, end: backShiningFinalHeight)
        .animate(_marsHeightAnimationController)
        .value;
    _earthReverseAnimation = Tween<double>(begin: 0.1,end: 0.5).animate(animationController);

    _earthOpacityAnimation = Tween<double>(begin: 1.0,end: 0.0).animate(animationController);
    _earthAnimation =  CurvedAnimation(
      curve: Curves.easeOut,
      parent: _earthReverseAnimation,
    );

    rotetionAnimation =
        Tween<double>(begin: 0, end: pi / 2).animate(animationController);
    sizeAnimation =
        Tween<double>(begin: 700, end: 700).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    customHeight = MediaQuery.of(context).size.height;
    customWidth = MediaQuery.of(context).size.width;
    animationController.forward();
    animationController.repeat();

    return Scaffold(
      body: Container(
        child: PageView.builder(
          itemCount: Data.planetsList.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(color: rBGColor),
                setPlanets(),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 1500),
                  top: customHeight * 0.45,
                  child: BackShining(
                    backHeight: backShiningHeight,
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),  SizedBox(), SizedBox(),
                      Hero(
                        tag: "title",
                        child: Text(
                          Data.planetsList[index].name,
                          style: GoogleFonts.exo(
                              textStyle: const TextStyle(
                                color: rWhiteColor,
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      AnimatedBuilder(
                          builder: (context, _) {
                            return Transform.rotate(
                              angle: rotetionAnimation.value,
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed("/details_screen", arguments: Data.planetsList[index]);
                                },
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  child:  Hero(
                                    tag: "mercury",
                                    child: Image.asset(
                                      Data.planetsList[index].image,
                                      height: 500,
                                      width: 500,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ),
                              ),
                            );
                          },
                          animation: animationController),
                   /*   Image.asset(
                        Data.planetsList[index].image,
                        height: 530,
                        width: 500,
                        fit: BoxFit.cover,
                      )*/
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget setPlanets() {
    return Stack(
      children: [
        Positioned(
            left: customHeight * 0.24,
            top: customHeight * 0.1,
            child: planetsCircle(height: 5.0)),
        Positioned(
            left: customHeight * 0.35,
            top: customHeight * 0.2,
            child: planetsCircle(height: 3.0)),
        Positioned(
            left: customHeight * 0.4,
            top: customHeight * 0.3,
            child: planetsCircle(height: 4.0)),
        Positioned(
            left: customHeight * 0.15,
            top: customHeight * 0.24,
            child: planetsCircle(height: 3.0)),
        Positioned(
            left: customHeight * 0.03,
            top: customHeight * 0.4,
            child: planetsCircle(height: 2.0)),
        Positioned(
            left: customHeight * 0.05,
            top: customHeight * 0.19,
            child: planetsCircle(height: 2.0)),
      ],
    );
  }

  Widget planetsCircle({height}) {
    return CircleAvatar(
      backgroundColor: Colors.white30,
      radius: height,
    );
  }
}
/*  body: FutureBuilder(
          future: jsonData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              String? data = snapshot.data;
              List allPosts = (data == null) ? [] : jsonDecode(data);
              print("allPosts::${allPosts}");
              for (int i = 0; i < allPosts.length; i++) {
                planetValues.add(PlanetsDesModel.fromMap(allPosts[i] as Map));
              }

              return Container(
                  alignment: Alignment.center,

                  child: ListView.builder(
                    itemCount: planetValues.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(
                                planetValues[0]
                                    .image))), //NetworkImage(planetValues[index].image.replaceFirst("file:///", "https://")
                      );
                    },));
            } else if (snapshot.hasError) {
              return Center(child: Text("ERROR : ${snapshot.error}"));
            }
            return Center(child: CircularProgressIndicator());
          },
        )*/
