import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_designs/screens/second_screen.dart';

import 'package:ui_designs/widgets/stack_widget_for_screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return 
    
    
    Scaffold(
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            label: "Home",

            icon: Icon(Icons.home),
          ),
           BottomNavigationBarItem(
            label: "Share",

           icon: Icon(Icons.share),
          ),
           BottomNavigationBarItem(
            label: "Coins",

            icon: GestureDetector(
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen()));
              },
              child: Icon(Icons.money)),
          ),
          
        ],),
      ),
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Car Shoppee"),
        leading: Transform.scale(
            scale: 0.5,
            child: Image.asset(
              "assets/sidemenu.png",
              color: Colors.white,
              fit: BoxFit.contain,
            )),
        actions: [
          Icon(
            FontAwesomeIcons.shoppingBag,
            size: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Icon(FontAwesomeIcons.bell),
          )
        ],
      ),
      body: CustomScrollView(slivers: [
        
        SliverToBoxAdapter(
          child: StackForApp("1")
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xff303944),
                      borderRadius: BorderRadius.circular(20)),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 80,
                        child: Image.asset(
                          "assets/shoppe_btn.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 80,
                        child: Image.asset(
                          "assets/carspa.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 80,
                        child: Image.asset(
                          "assets/mechanical.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 80,
                        child: Image.asset(
                          "assets/quick.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shoppe",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("More >")
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverGrid.count(
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 0.8,
          crossAxisCount: 3,
          children: [
            Image.asset('assets/1.png'),
            Image.asset('assets/2.png'),
            Image.asset('assets/3.png'),
            Image.asset('assets/4.png'),
            Image.asset('assets/5.png'),
            Image.asset('assets/6.png'),
          ],
        ),
      ]),
    );
  }
}
