import 'package:assignment_1/constant.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({ key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: screenWidth(context)*(1/30)
      ),
      width: screenWidth(context)*(1/2.5),
      height: screenWidth(context)*(1/2.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [BoxShadow(
          color: Colors.grey[350],
          blurRadius: 2,
          spreadRadius: 1,
          offset: Offset(0,0)
        )]
      ),
      child: Column(
        children: [
          Flexible(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.brown
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(context)*(1/30)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ice Cream Sandwich',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: screenHeight(context)*(1/45)
                    ),
                  ),
                  Text(
                    'Rp20.000',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: screenHeight(context)*(1/50),
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}