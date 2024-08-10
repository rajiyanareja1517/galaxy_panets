import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:galaxy_planets/models/planets_des_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';
import '../../custom_class/custom_class.dart';
import '../../custom_class/show_planet_details.dart';
class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> with TickerProviderStateMixin{
  double customHeight = 0.0;
  double customWidth = 0.0;
  double backShiningHeight = 300.0;
  late Animation rotetionAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 15),
        lowerBound: 0,
        upperBound: 1);
    rotetionAnimation =
        Tween<double>(begin: 0, end: pi / 2).animate(animationController);
  }



  @override
  Widget build(BuildContext context) {

    Constants.model=Get.arguments;

    animationController.forward();
    animationController.repeat();

    return Scaffold(
      body: Scaffold(
        body: Stack(
          children: [
            Container(color: rBGColor),

            AnimatedPositioned(
              duration: Duration(milliseconds: 1500),
              top: 90,
              child: BackShining(
                backHeight: backShiningHeight,
              ),
            ),
            setPlanets(),
            Container(
              child: Column(

                children: [
                 SizedBox(height: 50,),
                 Hero(
                   tag: "title",
                   child: Text(
                       Constants.model.name,
                       style: GoogleFonts.exo(
                           textStyle: const TextStyle(
                             color: rWhiteColor,
                             fontSize: 30,
                             fontWeight: FontWeight.bold,
                           ))),
                 ),
                 Stack(
                   children: [
                     AnimatedBuilder(
                         builder: (context, _) {
                           return Transform.rotate(
                             angle: rotetionAnimation.value,
                             child: InkWell(
                               onTap: () {
                                 // Get.toNamed("/details_screen", arguments: Data.planetsList[index]);
                               },
                               child: Container(
                                   alignment: Alignment.bottomCenter,
                                   child:  Hero(
                                     tag: "mercury",
                                     child: Image.asset(
                                       Constants.model.image,
                                       height: 350,
                                       width: 350,
                                       fit: BoxFit.cover,
                                     ),
                                   )
                               ),
                             ),
                           );
                         },
                         animation: animationController),
                     AnimatedPositioned(
                       top: customHeight * 0.15,
                       right:  customWidth * 0.06 ,
                       duration: const Duration(milliseconds: 1500),
                       child: const Center(
                         child: ShowTemprature(),
                       ),
                     )
                   ],
                 ),

                  Expanded(
                    child: AnimatedPositioned(
                      top: customHeight * 0.48,
                      right:customWidth * 0 ,
                      duration: const Duration(milliseconds: 1500),
                      child: const Center(
                        child: ShowPlanetDetails(),
                      ),
                    ),

                  ),

                ],
              ),
            ),

          ],
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
