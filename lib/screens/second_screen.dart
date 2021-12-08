import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_designs/widgets/picture_widget.dart';
import 'package:ui_designs/widgets/stack_widget_for_screens.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: StackForApp("2"),
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
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
          SliverGrid.count(
            mainAxisSpacing: 20,
            crossAxisSpacing: 4,
            childAspectRatio: 1.8,
            crossAxisCount: 3,
            children: [
              PictureWidget('assets/polish.png'),
              PictureWidget('assets/mechanic.png'),
              PictureWidget('assets/carwash.png'),
              PictureWidget('assets/peri.png'),
              PictureWidget('assets/oil.png'),
              PictureWidget('assets/polish.png'),
           
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Divider(
                  thickness: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
