import 'package:assignment_1/components/subPageCards.dart';
import 'package:assignment_1/constant.dart';
import 'package:assignment_1/pages/detailPage.dart';
import 'package:flutter/material.dart';

class SubPage extends StatelessWidget {
  final List<dynamic> data;
  const SubPage({ key, @required this.data }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: screenHeight(context)*(1/30),
        right: screenWidth(context)*(1/20),
      ),
      width: double.infinity,
      height: screenHeight(context)*(1/2.15),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: this.data == null ? 0 : this.data.length,
          itemBuilder: (context, index){
            return SubPageCard(
              nama: this.data[index]['nama'],
              rating: this.data[index]['rating'].toDouble(),
              harga: this.data[index]['harga'],
              gambar: this.data[index]['image'],
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedPage(
                  nama: this.data[index]['nama'],
                  bahan: this.data[index]['bahan'],
                  deskripsi: this.data[index]['deskripsi'],
                  harga: this.data[index]['harga'],
                  gambar: this.data[index]['image'],
                  rating: this.data[index]['rating'].toDouble(),
                )));
              },
            );
          },
        )
      )
    );
  }
}