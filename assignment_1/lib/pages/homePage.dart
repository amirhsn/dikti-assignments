import 'dart:convert';

import 'package:assignment_1/components/cards.dart';
import 'package:assignment_1/components/menuBar.dart';
import 'package:assignment_1/constant.dart';
import 'package:assignment_1/pages/detailPage.dart';
import 'package:assignment_1/pages/subPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({ key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

enum BottomMenu{
  NewTaste,
  Popular,
  Recommended
}

class _HomePageState extends State<HomePage> {
  BottomMenu bottomMenu = BottomMenu.NewTaste;
  List<dynamic> headerFood, newFood, popularFood, recFood;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      loadJson();
    }

  //LOAD JSON
  void loadJson() async{
    String data = await rootBundle.loadString('assets/foodData.json');
    var hasilJson = jsonDecode(data);
    headerFood = hasilJson['data']['header'];
    newFood = hasilJson['data']['new_taste'];
    popularFood = hasilJson['data']['popular'];
    recFood = hasilJson['data']['recommended'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            SizedBox(
              height: screenHeight(context)*(1/50),
            ),
            Container(
              width: double.infinity,
              height: screenHeight(context)*(1/5),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: headerFood == null ? 0 : headerFood.length,
                itemBuilder: (context, index){
                  return Cards(
                    nama: headerFood[index]['nama'],
                    harga: headerFood[index]['harga'],
                    gambar: headerFood[index]['image'],
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedPage(
                        nama: headerFood[index]['nama'],
                        bahan: headerFood[index]['bahan'],
                        deskripsi: headerFood[index]['deskripsi'],
                        harga: headerFood[index]['harga'],
                        gambar: headerFood[index]['image'],
                        rating: headerFood[index]['rating'].toDouble(),
                      )));
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: screenHeight(context)*(1/10),
            ),
            Container(
              width: double.infinity,
              height: screenHeight(context)*(1/18),
              child: Row(
                children: [
                  MenuBar(
                    namaMenu: 'New Taste',
                    onPressed: (){
                      setState(() {
                        bottomMenu = BottomMenu.NewTaste;
                      });
                    },
                    isPressed: bottomMenu == BottomMenu.NewTaste ? true : false,
                  ),
                  MenuBar(
                    namaMenu: 'Popular',
                    onPressed: (){
                      setState(() {
                        bottomMenu = BottomMenu.Popular;
                      });
                    },
                    isPressed: bottomMenu == BottomMenu.Popular ? true : false,
                  ),
                  MenuBar(
                    namaMenu: 'Recommended',
                    onPressed: (){
                      setState(() {
                        bottomMenu = BottomMenu.Recommended;
                      });
                    },
                    isPressed: bottomMenu == BottomMenu.Recommended ? true : false,
                  ),
                ],
              ),
            ),
            getSubPage(bottomMenu)
          ],
        )
      ),
    );
  }

  dynamic getSubPage(BottomMenu page){
    switch (page) {
      case BottomMenu.NewTaste:
        return SubPage(data: newFood);
        break;
      case BottomMenu.Popular:
        return SubPage(data: popularFood);
        break;
      case BottomMenu.Recommended:
        return SubPage(data: recFood);
        break;
      default:
        return SubPage(data: newFood);
        break;
    }
  }

}