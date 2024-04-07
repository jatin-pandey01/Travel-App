import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/utils/colors.dart';

class HotDestination extends StatelessWidget {
  final String image ;
  final String name ;
  const HotDestination(this.image,this.name,{super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Hero(
      tag: image,
      child: Scaffold(
        body: Stack(
          children: [
            //For background image
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
                ),
              ),
            ),
            //For back button
            Positioned(
              top: MediaQuery.of(context).padding.top,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_rounded, 
                  size: 40, 
                  color: Colors.white,),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height*0.58,
                width: size.width,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [background_color1,background_color2]
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name, 
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 25, 
                        color: primary_color.withOpacity(0.7)
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}