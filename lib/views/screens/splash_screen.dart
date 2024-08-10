import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black38, BlendMode.colorBurn),
                image: AssetImage(rSplashImage))),
        child: imageText(context),
      ),
    );
  }

  Widget imageText(context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EXPLORE',
            style: GoogleFonts.exo2(
                textStyle: TextStyle(fontSize: 35, color: rWhiteColor)),
          ),
          Text(
            'GALAXY',
            style: GoogleFonts.exo2(
                textStyle: TextStyle(fontSize: 35, color: rWhiteColor)),
          ),
          Text(
            'PLANETS',
            style: GoogleFonts.exo2(
                textStyle: TextStyle(fontSize: 35, color: rWhiteColor)),
          ),
          SizedBox(
            height: 10,
          ),
          CupertinoButton(
            minSize: 0,
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.arrow_forward_sharp,
              color: Colors.white60,
              size: 30,
            ),
            onPressed: () {
              Get.toNamed('/home_screen');
            },
          ),
          SizedBox(height: 120,)
        ],
      ),
    );
  }
}
