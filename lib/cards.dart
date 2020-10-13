import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news_fringe/news_data.dart';
import 'package:news_fringe/screens/news_screen.dart';
import 'package:provider/provider.dart';
import 'package:news_fringe/constants.dart';

class CardNewTile extends StatelessWidget {
  final String title;
  final String description;
  final String content;
  final String link;
  final String imageUrl;
  var time;
  CardNewTile(this.title,this.description,this.content,this.imageUrl,this.link,this.time);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Provider.of<NewsData>(context,listen: false).getNewsScreenData(title, description, content, time, imageUrl, link);
        Navigator.pushNamed(context, NewsScreen.id);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 5,left: 5),
        child: GestureDetector(
          onTap: (){

            Provider.of<NewsData>(context,listen: false).getNewsScreenData(title, description,
                content, time, imageUrl,link )
            ;
            Navigator.pushNamed(context,NewsScreen.id );
          },
          child: Material(

            borderRadius: BorderRadius.circular(10),
            elevation: 2,
            child: Row(
              children: <Widget>[

                Expanded(
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) ),
                      child: Image(fit:BoxFit.cover,height:double.maxFinite,image: NetworkImage('${imageUrl}'))),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text('${title}',style:kHeadingTextStyle),
                )


              ],

            ),
          ),
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String content;
  final String link;
  final String imageUrl;
  var time;
  NewsCard(this.imageUrl,this.title,this.time,this.content,this.description,this.link);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Provider.of<NewsData>(context,listen: false).getNewsScreenData(this.title, this.description, this.content, this.time,this.imageUrl,this.link);
        Navigator.pushNamed(context, NewsScreen.id);

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),

        child:Container(
          width: MediaQuery.of(context).size.width/1.5,
          decoration: BoxDecoration(image: DecorationImage(fit:BoxFit.cover,image:NetworkImage (imageUrl)),
            borderRadius:BorderRadius.circular(5), ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title,
                    style:kHeadingTextStyle.copyWith(color: Colors.white)),
              ),

            ],

          ),
        ),
      ),
    );


  }
}
class ListViewTIle extends StatelessWidget {
  final String title;
  final String description;
  final String content;
  final String link;
  final String imageUrl;
  final  time;
  ListViewTIle(this.imageUrl,this.title,this.time,this.content,this.description,this.link);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){ Provider.of<NewsData>(context,listen: false).getNewsScreenData(this.title, this.description, this.content, this.time,this.imageUrl,this.link);
      Navigator.pushNamed(context, NewsScreen.id);},
      child: Container(
        height: MediaQuery.of(context).size.height/6,
        child: Row(
          children: <Widget>[
            Expanded(flex: 1,
              child: ClipRRect(

                child: Image(image: NetworkImage('$imageUrl'),fit: BoxFit.cover,height: double.maxFinite,),

              ),
            ),
            SizedBox(width: 10,),
            Expanded(
                flex: 2,
                child: Text(title,style: kTextStyle.copyWith(fontWeight: FontWeight.bold),)),

          ],

        ),
      ),
    );
  }
}

