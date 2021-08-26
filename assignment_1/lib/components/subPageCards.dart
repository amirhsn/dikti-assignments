import 'package:assignment_1/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SubPageCard extends StatelessWidget {
  const SubPageCard({ key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight(context)*(1/9.5),
      margin: EdgeInsets.only(
        bottom: screenHeight(context)*(1/40)
      ),
      child: Row(
        children: [
          Container(
            height: screenHeight(context)*(1/9.5),
            width: screenHeight(context)*(1/9.5),
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          SizedBox(
            width: screenWidth(context)*(1/30),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rujak Asem',
                style: TextStyle(
                  fontSize: screenHeight(context)*(1/45),
                  fontWeight: FontWeight.w600
                ),
              ),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: hijau
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                    itemSize: screenHeight(context)*(1/40),
                    ignoreGestures: true,
                  ),
                  SizedBox(
                    width: screenWidth(context)*(1/60),
                  ),
                  Text(
                    '3.6',
                    style: TextStyle(
                      fontSize: screenHeight(context)*(1/55),
                      fontWeight: FontWeight.w600,
                      color: Colors.grey
                    ),
                  )
                ],
              ),
              Text(
                'Rp20.000',
                style: TextStyle(
                  fontSize: screenHeight(context)*(1/50),
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}