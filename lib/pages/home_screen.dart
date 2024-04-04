import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/utils/colors.dart';
import 'package:travel_app/utils/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                  background_color1,
                  background_color2,
                  background_color2
                ])
              ),
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10,right: 20, left: 20, bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Destination", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 35,color: primary_color),),
                        CircleAvatar(
                          radius: 22, 
                          backgroundColor: Colors.white12,
                          child: Icon(Icons.search_outlined, color: Colors.white54, size: 30,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 220,
                    child:ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: destination.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: EdgeInsets.only(left: index == 0? 20 : 0),
                          child: scrollableImage(context, destination[index]["image"]!),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: size.height*0.035,),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Hot Destination", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25, color: primary_color.withOpacity(0.7)),),
                        const Text("More", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white24),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: hotDestination.length,
                      itemBuilder: (context,index) {
                        return Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                          child: hotDestinationItems(context,hotDestination[index]["image"]!,hotDestination[index]["name"]!, hotDestination[index]["noOfPlace"]!),
                        );
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35, right: 20, left: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Visiters Reviews", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22, color: primary_color.withOpacity(0.7)),),
                        const Text("22 Reviews", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white24),),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/profile.png'),
                          radius: 25,
                        ),
                        SizedBox(width: 20,),
                        
                      ],
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

  Widget scrollableImage(BuildContext context, String image){
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(right: 20),
          width: size.width/1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //For Image shadow, use Positioned
        Positioned(
          top: 0, 
          left: 0,
          child: Opacity(
            opacity: 1,
            child: Container(
              height: 220,
              width: size.width/1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [secondary_color,Colors.transparent]
                )
              ),
            ),
          )
        )
      ],
    );
  }
  
  Widget hotDestinationItems(BuildContext context, String image, String name, String noOfPlace){
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            height: 220,
            width: 150,
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
          //For image shadow, use Positioned
          Positioned(
            top: 0,
            left: 0,
            child: Opacity(
              opacity: 1,
              child: Container(
                height: 220,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [secondary_color,Colors.transparent]
                  )
                ),
              ),
            ),
          ),
          //For name and more
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(name,style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: primary_color.withOpacity(0.8)),),
                Text(noOfPlace,style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 11, color: Colors.white30),)
              ],
            )
          )
        ],
      ),
    );
  }

}