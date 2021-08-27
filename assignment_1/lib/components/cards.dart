import 'package:assignment_1/constant.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final Function onPressed;
  final String nama, harga, gambar;
  const Cards({ key, @required this.onPressed, @required this.nama, @required this.harga, @required this.gambar }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        margin: EdgeInsets.only(
          right: screenWidth(context)*(1/30)
        ),
        width: screenWidth(context)*(1/2.5),
        height: screenWidth(context)*(1/2.5),
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.grey[200],
            blurRadius: 0.5,
            spreadRadius: 0.5,
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
                  image: DecorationImage(
                    image: NetworkImage(this.gambar),
                    fit: BoxFit.fill,
                  )
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context)*(1/30)
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.white
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.nama,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: screenHeight(context)*(1/45)
                      ),
                    ),
                    Text(
                      this.harga,
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
      ),
    );
  }
}