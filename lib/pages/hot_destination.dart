import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/utils/colors.dart';
import 'package:travel_app/utils/model.dart';

class HotDestination extends StatelessWidget {
  final String image ;
  final String name ;
  final String info1;
  final String info2;
  const HotDestination(this.image,this.name,this.info1, this.info2,{super.key});

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
              height: size.height*0.42 + 30,
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
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [background_color1,background_color2]
                  ),
                ),
                child: SingleChildScrollView(
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
                      Text(
                        info1, 
                        textAlign: TextAlign.justify, 
                        style: const TextStyle(
                          color: Colors.white54, 
                          fontSize: 15, 
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        info2, 
                        textAlign: TextAlign.justify, 
                        style: const TextStyle(
                          color: Colors.white54, 
                          fontSize: 15, 
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Text(
                        "Tourist Places",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: primary_color.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      SizedBox(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            scrollItem("images/travel.png"),
                            SizedBox(width: 20,),
                            scrollItem("images/travel1.png"),
                            SizedBox(width: 20,),
                            scrollItem("images/travel2.png"),
                            SizedBox(width: 20,),
                            scrollItem("images/mountain.png"),
                            SizedBox(width: 20,),
                            scrollItem("images/beach.png"),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: size.width,
                        height: 60,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: light_secondary,
                        ),
                        child: Center(
                          child: Text(
                            "Select Location", 
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: primary_color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  Widget scrollItem(String image){
    return Stack(
      children: [
        Container(
          height: 150,
          width: 170,
          // margin: EdgeInsets.only(right: 25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Opacity(
            opacity: 0.5,
            child: Container(
              height: 170,
              width: 170,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [secondary_color,Colors.transparent],
                ),
              ),
            ),
          ),
        )
      ]
    );
  }
}