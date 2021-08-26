import 'package:assignment_1/components/subPageCards.dart';
import 'package:assignment_1/constant.dart';
import 'package:flutter/material.dart';

class SubPage extends StatelessWidget {
  final Color warna;
  const SubPage({ key, @required this.warna }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: screenHeight(context)*(1/30),
        right: screenWidth(context)*(1/20),
      ),
      width: double.infinity,
      height: screenHeight(context)*(1/2.15),
      color: warna,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          shrinkWrap: true,
          children: [
            SubPageCard(),
            SubPageCard(),
            SubPageCard(),
            SubPageCard(),
            SubPageCard(),
          ],
        ),
      )
    );
  }
}