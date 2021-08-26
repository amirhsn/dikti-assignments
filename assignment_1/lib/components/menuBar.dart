import 'package:assignment_1/constant.dart';
import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {
  final String namaMenu;
  const MenuBar({ key, @required this.namaMenu }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.only(
          right: screenWidth(context)*(1/40)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              namaMenu,
              style: TextStyle(
                fontSize: screenHeight(context)*(1/50),
                fontWeight: FontWeight.w500
              ),
            ),
            Container(
              color: hijau,
              width: screenWidth(context)*(1/10),
              height: screenHeight(context)*(1/150),
            )
          ],
        ),
      ),
    );
  }
}