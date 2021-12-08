import 'package:flutter/material.dart';

class PictureWidget extends StatelessWidget {
  String path ;
   PictureWidget(this.path);

  @override
  Widget build(BuildContext context) {
    return Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                height: 80,
                child: Image.asset(
                  path,
                ),
              );
  }
}
