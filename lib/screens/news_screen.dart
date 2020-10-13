import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_fringe/news_data.dart';
import 'package:news_fringe/constants.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
class NewsScreen extends StatefulWidget {
  static String id='news';

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  Widget build(BuildContext context) {
  String link=Provider.of<NewsData>(context,listen: false).link;
    final mediaHeight=MediaQuery.of(context).size.height;
    return Scaffold(
backgroundColor: Colors.white,
      
body: Container(
  decoration: BoxDecoration(

  ),
  child:SingleChildScrollView(
    child: Column(

      children: <Widget>[

       Stack(

         children: <Widget>[
           Container(
           height: MediaQuery.of(context).size.height/3,
               decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight:Radius.circular(20),bottomLeft:Radius.circular(20))),
               child:  ClipRRect(

                   child: Image.network('${Provider.of<NewsData>(context,listen: false).urlToImage}',fit:BoxFit.cover,))

           ),

Positioned(
  bottom: 0,
  child:   Container(
decoration: BoxDecoration(
  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
  ,color: Colors.white,
),
    height:MediaQuery.of(context).size.height/40,
    width: MediaQuery.of(context).size.width,



  ),
  
),
           Positioned(
               top: 40,
               left: 20,
               child: GestureDetector(
                   onTap: (){
                     Navigator.pop(context);

                   },
                   child: Icon(Icons.arrow_back,color: Colors.white,size:30,)))
         ],
       ),
        Container(
          decoration: BoxDecoration(

color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8,right: 8,),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
            children: <Widget>[
            SizedBox(height: 10,),
            Text(Provider.of<NewsData>(context,listen: false).title,style: kHeadingTextStyle.copyWith(fontSize: 20),),
            SizedBox(height: 10,),
            Text(Provider.of<NewsData>(context,listen: false).description,style: kTextStyle.copyWith(fontWeight: FontWeight.w700,fontSize: 15),),
            SizedBox(height: 15,),
            Text(Provider.of<NewsData>(context,listen: false).content,style: kTextStyle,),
SizedBox(height: 10,),
        GestureDetector(

                onTap: (){
                  launch('${Provider.of<NewsData>(context,listen: false).link}');
                },

                child: Text('for more click here',textAlign: TextAlign.left,style: kHeadingTextStyle.copyWith(color: Colors.black),)),


            ],


            ),
          ),
        ),
        )

      ],


    ),
  ),


),
    );
  }
}
