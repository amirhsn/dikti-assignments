import 'package:assignment_1/constant.dart';
import 'package:flutter/material.dart';

class MenuBar extends StatefulWidget {
  final String namaMenu;
  final Function onPressed;
  final bool isPressed;
  const MenuBar({ key, @required this.namaMenu, @required this.onPressed, @required this.isPressed }) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.only(
          right: screenWidth(context)*(1/40)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.namaMenu,
              style: TextStyle(
                fontSize: screenHeight(context)*(1/50),
                fontWeight: FontWeight.w500,
                color: widget.isPressed ? Colors.black : Colors.grey[350]
              ),
            ),
            Container(
              color: widget.isPressed ? hijau : Colors.white,
              width: screenWidth(context)*(1/10),
              height: screenHeight(context)*(1/150),
            )
          ],
        ),
      ),
    );
  }
}