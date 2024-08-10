import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/planets_des_model.dart';
import 'custom_card.dart';


class ShowPlanetDetails extends StatefulWidget {

  const ShowPlanetDetails(
      {super.key});


  @override
  State<ShowPlanetDetails> createState() => _ShowPlanetDetailsState();
}

class _ShowPlanetDetailsState extends State<ShowPlanetDetails> {


  List<CustomCard> listOfWidgets =[];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final Tween<Offset> _offset = Tween(begin: const Offset(1, 0),end: const Offset(0, 0));

  Color bgColor = Colors.transparent;

  Future<void> _addData() async {

    List<CustomCard> listOfData = [
      CustomCard(
        leading: Image.asset(rSpeedometerImage,color: Colors.white),
        title: 'Average orbital speed',
        subtitle: Constants.model.average_orbital_speed ,
      ),
      CustomCard(
        leading: Image.asset(rSpeedometerImage,color: Colors.white),
        title: 'Satellite',
        subtitle: Constants.model.satellite,
      ),
      CustomCard(
        leading: Image.asset(rSpeedometerImage,color: Colors.white),
        title: "Surface area",
        subtitle: Constants.model.surface_area,
      ),
      CustomCard(
        leading: Image.asset(rSpeedometerImage,color: Colors.white),
        title: "Rotation period",
        subtitle: Constants.model.rotation_period,
      ),

    ];

    for(var data in listOfData){
      await Future.delayed(const Duration(milliseconds: 500));
      listOfWidgets.add(data);
      _listKey.currentState?.insertItem(listOfWidgets.length - 1);

    }

    setState(() {
      bgColor = rCardBGColor;
    });


  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addData();
    });
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 1,
        duration: const Duration(seconds: 1),
        color: bgColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: AnimatedList(
              key: _listKey,
              scrollDirection: Axis.vertical,
              initialItemCount: listOfWidgets.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context,index,animation){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: SlideTransition(
                    position: animation.drive(_offset),
                    child: listOfWidgets[index],
                  ),
                );
              }
          ),
        )
    );
  }
}
