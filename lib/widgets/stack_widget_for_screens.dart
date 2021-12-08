import 'package:flutter/material.dart';

class StackForApp extends StatelessWidget {
  String screen;
   StackForApp(this.screen);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
            children: [
             screen == "1" ? Image.asset("assets/bannerbas.jpg"):Container(),
            screen == "1" ?  Image.asset("assets/bannerbas.jpg"): Container(),
              Stack(
                alignment: Alignment.center,
                children: [
                screen == "1" ?  Image.asset("assets/bannerbas.jpg"): Image.asset("assets/banner2.jpg",),
                  Positioned(
                   top:screen == "1" ?  0 : 80,
                    child: screen == "1" ? Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(25)),
                      height: 40,
                      width: size.width * 0.9,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Transform.scale(
                            scale: 0.5,
                            child: Image.asset(
                              "assets/filter.png",
                              color: Colors.white,
                            ),
                          ),
                          suffixIcon: Transform.scale(
                            scale: 0.5,
                            child: Image.asset(
                              "assets/search.png",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ): Container(),
                  ),
                ],
              ),
           screen == "1" ?   Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Image.asset("assets/banner.jpg"),
                  Positioned(
                    bottom: 20,
                    child: Container(
                        width: size.width * 0.8,
                        height: 30,
                        child: Row(
                          children: [
                            IntrinsicWidth(
                              child: Row(
                                children: [
                                  Image.asset("assets/caricon.png"),
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      alignment: Alignment.center,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.5)),
                                      ),
                                      child: Text(
                                        "Enter car details >>>",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ): Container(),
            ],
          );
  }
}