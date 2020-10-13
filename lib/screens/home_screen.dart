

import 'dart:convert';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news_fringe/Silver_.dart';
import 'package:news_fringe/cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_fringe/cards.dart';
import 'package:news_fringe/News.dart';
import 'package:news_fringe/news_data.dart';
import 'package:news_fringe/screens/categoryNews.dart';
import 'package:news_fringe/screens/news_screen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loading_screen.dart';
import 'package:news_fringe/drawer.dart';
import 'package:http/http.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';
 import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_fringe/constants.dart';
String search;
bool modalProgress=false;
final _store=Firestore.instance;
final _auth=FirebaseAuth.instance;
FirebaseUser user;
void getUser()async
{user= await _auth.currentUser();

}
class HomePage extends StatefulWidget {
 static String id='home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
   String day=(DateTime.now().day<10)?'0${DateTime.now().day}':'${DateTime.now().day}';
   String month=(DateTime.now().month<10)?'0${DateTime.now().month}':'${DateTime.now().month}';

   void getBookmarkNews()async
   {final _auth=FirebaseAuth.instance;
   final _store=Firestore.instance;
   final user= await _auth.currentUser();
   if (user!=null)
   {
     var snapshots=_store.collection('${user.email}').snapshots();

     await for  (var snapshot in snapshots)
     {for(var document in snapshot.documents)
     {Provider.of<NewsData>(context,listen: false).bookmarkNews(News(document.data['title'], document.data['description'],
         document.data['content'], document.data['url'], document.data['imageUrl'],document.data['time']));

     }


     }
     {

     }

   }

   }
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
getUser();

  _tabController=TabController(length: 3, vsync: this);
  }

  @override

  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
backgroundColor: Color.fromRGBO(242, 242, 242, 1),
        appBar: AppBar(
title: Text('NewsFringe',style:kTextStyle.copyWith(color: Colors.white), ),
          centerTitle: true,
          backgroundColor: Colors.black,
iconTheme: IconThemeData(color: Colors.white),
          bottom: TabBar(

              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home),
                  child: Text('Home'),
                ),
                Tab(
                  icon: Icon(Icons.search),
                  child: Text('Search'),

                ),
                Tab(
                  icon: Icon(Icons.bookmark),
                  child: Text('Bookmark'),

                ),



              ]),
        ),
        drawer:NavDrawer(),




body: TabBarView(children: [
SilverScroll(),
  /* Column(crossAxisAlignment: CrossAxisAlignment.stretch,
   
   children: <Widget>[
SizedBox(height: 5,),
     Text('WORLD',style: kTextStyle.copyWith(fontSize:20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
     SizedBox(height: 10,),
     Expanded(flex: 5,
   child: ListView.builder(
     scrollDirection: Axis.horizontal,
     itemCount: 9,
     itemBuilder: (BuildContext context,int index)

{
  return NewsCard(LoadingScreen.imageUrl[index], LoadingScreen.title[index],LoadingScreen.time[index],LoadingScreen.content[index],LoadingScreen.description[index],LoadingScreen.link[index]);

}

   ),

 ),
     Text('INDIA',style: kTextStyle.copyWith(fontSize:20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
     Expanded(flex: 6,
       child: CarouselSlider(
options: CarouselOptions(

  enableInfiniteScroll: true,
  enlargeCenterPage: true
   ,
  autoPlay: true,
  autoPlayInterval: Duration(seconds: 3),
  autoPlayAnimationDuration: Duration(milliseconds: 800),



),
           items: [0,1,2,3,4,5,6,7,8,9].map((i){
             return Builder(builder: (BuildContext context)

             {return CardNewTile(LoadingScreen.google[i].title, LoadingScreen.google[i].description,
                 LoadingScreen.google[i].content, LoadingScreen.google[i].urlToImage, LoadingScreen.google[i].url,
                 LoadingScreen.google[i].time);


             }
             );


           }).toList(),
          ),
     )
,
Expanded(
  flex: 10,
  child:   Container(
    color:kBackgroundC0lor,
    child:   ListView.builder(


      scrollDirection: Axis.vertical,
     itemBuilder: (BuildContext context,int index){

        return Padding(
          padding: const EdgeInsets.only(top: 2),
          child: GestureDetector(
            onTap: (){Provider.of<NewsData>(context,listen: false).getNewsScreenData(LoadingScreen.indiaTitle[index], LoadingScreen.indiaDesc[index],
                LoadingScreen.indiaContent[index], LoadingScreen.indiaTitle[index], LoadingScreen.indiaImgUrl[index], LoadingScreen.indiaUrl[index]);
              Navigator.pushNamed(context, NewsScreen.id);
            },
            child: Material(

              elevation: 4,
              child: Container(
                height: MediaQuery.of(context).size.height/6,
                child: Row(

children: <Widget>[

  Expanded(
    child: ClipRRect(
      child: Image(image: NetworkImage('${LoadingScreen.indiaImgUrl[index]}'),fit: BoxFit.cover,height: double.maxFinite,),

    ),
  ),
  SizedBox(width: 10,),
  Expanded(
      flex: 2,
      child: Text(LoadingScreen.indiaTitle[index],style: kTextStyle.copyWith(fontWeight: FontWeight.bold),)),
],


                ),
              ),
            ),
          ),
        );

     }
,itemCount: LoadingScreen.indiaTitle.length,
    ),
  ),
)


   ],

 ),*/


  ModalProgressHUD(
    inAsyncCall: modalProgress,
    color: Colors.white,
    progressIndicator: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
    ),
    child: Center(
    child: Column(
      children: <Widget>[
        TextField(cursorColor: Colors.black,
          autofocus: true,
          decoration: InputDecoration(fillColor: Colors.black,focusColor:Colors.black,hoverColor: Colors.black,
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            suffixIcon: GestureDetector(child: Icon(Icons.search),onTap: () async{

if(search!=null)
{setState(() {
        modalProgress=true;
});

try{
        Response response=await get('https://newsapi.org/v2/everything?q=$search&from=2020-04-${DateTime.now().subtract(Duration(days: 7))}&to=${DateTime.now().year}-$month-$day&sortBy=popularity&apiKey=043956e1df974100930b8f70a53f5fc1');

        final body =response.body;
        var data=jsonDecode(body);
        List<News> searchResult=[];
        for (int i=0;i<19;i++)
        {searchResult.add(News(data['articles'][i]['title'], data['articles'][i]['description'],
        data['articles'][i]['description'],
        data['articles'][i]['url'], data['articles'][i]['urlToImage'],data['articles'][i]['time']));

        }

        Provider.of<NewsData>(context,listen: false).getListNews(searchResult, 'Top 20 search results for $search' );
        setState(() {
          modalProgress=false;
        });


}
catch(e){
        setState(() {
          modalProgress=false;
        });

}





                }

            },),


          ),

            onChanged: (value){
          search=value;
}

        ),
        Expanded(
          child: Container(
            child: Consumer<NewsData>(
builder: (context,newsData,child)
              { return ListView.builder(
                  itemCount: (newsData.NewsList.length==null)?0:newsData.NewsList.length,
                  itemBuilder: (BuildContext context,int index)
                  {
                    return Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        child: Material(
                          elevation: 5,
                          child: ListViewTIle(Provider.of<NewsData>(context).NewsList[index].urlToImage, Provider.of<NewsData>(context).NewsList[index].title,
                              Provider.of<NewsData>(context).NewsList[index].time,
                              Provider.of<NewsData>(context).NewsList[index].content,
                              Provider.of<NewsData>(context).NewsList[index].description,
                              Provider.of<NewsData>(context).NewsList[index].url ),
                        ),
                        secondaryActions: <Widget>[

                          IconSlideAction(

                            caption: 'Bookmark',
                            iconWidget: Icon(Icons.bookmark,color: Colors.white,size: 40,),
                            color: Colors.black,
                            onTap: (){
                              Provider.of<NewsData>(context,listen: false).bookmarkNews(News(
                                  Provider.of<NewsData>(context,listen: false).NewsList[index].title, Provider.of<NewsData>(context,listen: false).NewsList[index].description,
                                  Provider.of<NewsData>(context,listen: false).NewsList[index].content,
                                  Provider.of<NewsData>(context,listen: false).NewsList[index].url,
                                  Provider.of<NewsData>(context,listen: false).NewsList[index].urlToImage,
                                  Provider.of<NewsData>(context,listen: false).NewsList[index].time

                              ));

                              Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                    content: Text('The news is bookmarked',style: kHeadingTextStyle,),
                                    elevation: 10,

                                    action: SnackBarAction(label:'Bookmarked', onPressed: (){}),
                                    backgroundColor:Colors.black ,));


                            },
                          ),
                          IconSlideAction(
                            iconWidget: Icon(Icons.share,color: Colors.white,size: 40,),
                            caption: 'Share',
                            color: Colors.black,

                          )
                        ],
                      ),
                    );


                  }
              );}
            ),
          ),
        ),

      ],
    ),
    ),
  ),
  Container(
    color: Colors.white,
   child: Consumer<NewsData>(
       builder: (context,newsData,child)

   {
     return ListView.builder(
         itemCount:newsData.BookmarkList.length,itemBuilder: ( BuildContext context,int index)
     {

       return ListViewTIle(newsData.BookmarkList[index].urlToImage, newsData.BookmarkList[index].title,
           newsData.BookmarkList[index].time, newsData.BookmarkList[index].content,
           newsData.BookmarkList[index].description, newsData.BookmarkList[index].url)
     ;});

   }
   )

  )

],

),
      ),
    );
  }
}


