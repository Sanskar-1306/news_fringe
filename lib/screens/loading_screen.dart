import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_fringe/News.dart';
import 'package:news_fringe/constants.dart';
import 'package:news_fringe/screens/home_screen.dart';
class LoadingScreen extends StatefulWidget {
  static String id ='loading';
  static List<String> title=[];
  static List<String> description=[];
  static List<String> source=[];
  static List<String> author=[];
  static List <String> link=[];
  static List<String> content=[];
static List <News> worldList=[];
  static List <News> indiaList=[];
  static List <News> businessList=[];
  static List <News> entertaintmentList=[];
  static List <News> science=[];
static List<News> google=[];
  static List <News> health=[];
  static List <News> sports=[];
  static List <News> technology=[];
  static List time=[];
  static List<String>imageUrl=[];
  static List<String> indiaTitle=[];
static List<String> indiaContent=[];
static List<String> indiaUrl=[];
static List<String> indiaDesc=[];
static List<String> indiaImgUrl=[];



  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


void getWorldNews()async
{Response response=await get('http://newsapi.org/v2/top-headlines?sources=google-news&apiKey=043956e1df974100930b8f70a53f5fc1');
  print(response.statusCode);
  final  body=response.body;
  final data=json.decode(body);
  for (int i=0;i<data['totalResults'];i++)
    {LoadingScreen.title.add(data['articles'][i]['title']);
LoadingScreen.imageUrl.add(data['articles'][i]['urlToImage']);
    LoadingScreen.time.add(data['articles'][i]['publishedAt']);
    LoadingScreen.link.add(data['articles'][i]['url']);
LoadingScreen.content.add(data['articles'][i]['content']);
   LoadingScreen.description.add(data['articles'][i]['description']);
   LoadingScreen.author.add(data['articles'][i]['author']);

    }

  print(data['totalResults']);
print(data['articles']);

print(LoadingScreen.title);
print(LoadingScreen.imageUrl);
print(LoadingScreen.time);

}
getGoogleIndiaNews()async
{Response response=await get('http://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=043956e1df974100930b8f70a53f5fc1');
final body =response.body;
var data=json.decode(body);
for(int i=0;i<data['totalResults'];i++)
{
  LoadingScreen.google.add(News(data['articles'][i]['title'], data['articles'][i]['description'],
      data['articles'][i]['description'],
      data['articles'][i]['url'], data['articles'][i]['urlToImage'],data['articles'][i]['time']));

}


}
getIndiaNews()async
{
  Response response=await get('http://newsapi.org/v2/top-headlines?country=in&apiKey=043956e1df974100930b8f70a53f5fc1');
  final  body=response.body;
  final data=json.decode(body);
  print(data['totalResults']);
  for (int i=0;i<19;i++)
{
  LoadingScreen.indiaDesc.add(data['articles'][i]['description']);
  LoadingScreen.indiaTitle.add(data['articles'][i]['title']);
LoadingScreen.indiaImgUrl.add(data['articles'][i]['urlToImage']);
  LoadingScreen.indiaUrl.add(data['articles'][i]['url']);
  LoadingScreen.indiaContent.add(data['articles'][i]['content']);

}
  print(LoadingScreen.indiaDesc);
  print(LoadingScreen.indiaTitle);
  Navigator.pushNamed(context, HomePage.id);
}


void getBusinessNews()async{

  Response response= await get('http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=043956e1df974100930b8f70a53f5fc1');
  final body =response.body;
  var data=json.decode(body);
  for(int i=0;i<20;i++)
    {
      LoadingScreen.businessList.add(News(data['articles'][i]['title'], data['articles'][i]['description'],
          data['articles'][i]['description'],
          data['articles'][i]['url'], data['articles'][i]['urlToImage'],data['articles'][i]['time']));

    }
}
void getEntertainmentNews()async{

  Response response= await get('http://newsapi.org/v2/top-headlines?country=in&category=entertainment&apiKey=043956e1df974100930b8f70a53f5fc1');
  final body =response.body;
  var data=json.decode(body);
  for(int i=0;i<20;i++)
  {
    LoadingScreen.entertaintmentList.add(News(data['articles'][i]['title'], data['articles'][i]['description'],
        data['articles'][i]['description'],
        data['articles'][i]['url'], data['articles'][i]['urlToImage'],data['articles'][i]['time']));

  }


}
void getHealthNews()async{

  Response response= await get('http://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=043956e1df974100930b8f70a53f5fc1');
  final body =response.body;
  var data=json.decode(body);
  for(int i=0;i<20;i++)
  {
    LoadingScreen.health.add(News(data['articles'][i]['title'], data['articles'][i]['description'],
        data['articles'][i]['description'],
        data['articles'][i]['url'], data['articles'][i]['urlToImage'],data['articles'][i]['time']));

  }

}

void getSportsNews()async
{
  Response response= await get('http://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=043956e1df974100930b8f70a53f5fc1');
  final body =response.body;
  var data=json.decode(body);
  for(int i=0;i<20;i++)
  {
    LoadingScreen.sports.add(News(data['articles'][i]['title'], data['articles'][i]['description'],
        data['articles'][i]['description'],
        data['articles'][i]['url'], data['articles'][i]['urlToImage'],data['articles'][i]['time']));

  }

}
void getScienceNews()async{

  Response response= await get('http://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=043956e1df974100930b8f70a53f5fc1');
  final body =response.body;
  var data=json.decode(body);
  for(int i=0;i<20;i++)
  {
    LoadingScreen.science.add(News(data['articles'][i]['title'], data['articles'][i]['description'],
        data['articles'][i]['description'],
        data['articles'][i]['url'], data['articles'][i]['urlToImage'],data['articles'][i]['time']));

  }

}
void getTechNews()async{
  Response response= await get('http://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=043956e1df974100930b8f70a53f5fc1');
  final body =response.body;
  var data=json.decode(body);
  for(int i=0;i<20;i++)
  {
    LoadingScreen.technology.add(News(data['articles'][i]['title'], data['articles'][i]['description'],
        data['articles'][i]['description'],
        data['articles'][i]['url'], data['articles'][i]['urlToImage'],data['articles'][i]['time']));

  }


}


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBusinessNews();
getWorldNews() ;
getIndiaNews();
getEntertainmentNews();
getGoogleIndiaNews();
getHealthNews();
getScienceNews();
getSportsNews();
getTechNews();


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: Container(
  height: MediaQuery.of(context).size.height,
  width: MediaQuery.of(context).size.width,
  decoration:BoxDecoration(
  image:DecorationImage(image:AssetImage('images/newsFringe.jpg'),fit: BoxFit.cover)

),
  child: Column(

    children: <Widget>[

      SizedBox(height: MediaQuery.of(context).size.height/2,)
      ,



      SizedBox(height: 120,),
      CircularProgressIndicator(
        strokeWidth: 6,


        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      )


    ],





  ),
),
      


    );
  }

}



