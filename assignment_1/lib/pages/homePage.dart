import 'package:assignment_1/components/cards.dart';
import 'package:assignment_1/components/menuBar.dart';
import 'package:assignment_1/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({ key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amberAccent,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(
          left: screenWidth(context)*(1/20),
          top: screenHeight(context)*(1/13)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Paling Laris di Sekitarmu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenHeight(context)*(1/35)
              ),
            ),
            Container(
              width: double.infinity,
              height: screenHeight(context)*(1/5),
              color: Colors.amber,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Cards(),
                  Cards(),
                  Cards(),
                  Cards(),
                  Cards(),
                  Cards(),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: screenHeight(context)*(1/18),
              child: Row(
                children: [
                  MenuBar(
                    namaMenu: 'New Taste',
                  ),
                  MenuBar(
                    namaMenu: 'Popular',
                  ),
                  MenuBar(
                    namaMenu: 'Recommended',
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}