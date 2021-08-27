import 'package:assignment_1/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailedPage extends StatefulWidget {
  final String nama, harga, deskripsi, bahan, gambar;
  final double rating;
  const DetailedPage({ key, @required this.nama, @required this.harga, @required this.deskripsi, @required this.bahan, @required this.gambar, @required this.rating }) : super(key: key);

  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  int jumlah = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: screenHeight(context)*(1/2),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.gambar
                ),
                fit: BoxFit.cover
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: screenHeight(context)*(1/1.8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )
              ),
              padding: EdgeInsets.all(screenHeight(context)*(1/30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.nama,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: screenHeight(context)*(1/35)
                            ),
                          ),
                          SizedBox(
                            height: screenHeight(context)*(1/120),
                          ),
                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating: widget.rating.round().toDouble(),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: hijau
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                                itemSize: screenHeight(context)*(1/45),
                                ignoreGestures: true,
                              ),
                              SizedBox(
                                width: screenWidth(context)*(1/60),
                              ),
                              Text(
                                widget.rating.toString(),
                                style: TextStyle(
                                  fontSize: screenHeight(context)*(1/55),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: screenWidth(context)*(1/4.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  if (jumlah==0){
                                    jumlah = jumlah;
                                  }else{
                                    jumlah -= 1;
                                  }
                                });
                              },
                              child: Container(
                                height: screenHeight(context)*(1/30),
                                width: screenHeight(context)*(1/30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2
                                  )
                                ),
                                child: Icon(
                                  Icons.remove
                                )
                              ),
                            ),
                            Text(
                              jumlah.toString(),
                              style: TextStyle(
                                fontSize: screenHeight(context)*(1/40)
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  if (jumlah==99){
                                    jumlah = jumlah;
                                  }else{
                                    jumlah += 1;
                                  }
                                });
                              },
                              child: Container(
                                height: screenHeight(context)*(1/30),
                                width: screenHeight(context)*(1/30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2
                                  )
                                ),
                                child: Icon(
                                  Icons.add
                                )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: screenHeight(context)*(1/35)
                    ),
                  ),
                  Text(
                    widget.deskripsi == null ? '' : widget.deskripsi,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: screenHeight(context)*(1/50)
                    ),
                  ),
                  Text(
                    'Ingredients',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: screenHeight(context)*(1/35)
                    ),
                  ),
                  Text(
                    widget.bahan == null ? '' : widget.bahan,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: screenHeight(context)*(1/50)
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: screenHeight(context)*(1/45)
                            ),
                          ),
                          Text(
                            widget.harga,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: screenHeight(context)*(1/35)
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: screenWidth(context)*(1/2.2),
                        height: screenHeight(context)*(1/13),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              hijau,
                              Colors.green[400],
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            color: Colors.grey[500],
                            blurRadius: 1,
                            spreadRadius: 2,
                            offset: Offset(0,0)
                          )]
                        ),
                        child: Center(
                          child: Text(
                            'ORDER NOW',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: screenWidth(context)*(1/22),
                              letterSpacing: 1
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}