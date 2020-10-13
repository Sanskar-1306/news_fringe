

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_fringe/cards.dart';
import 'package:news_fringe/News.dart';
 import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news_fringe/news_data.dart';
import 'news_screen.dart';
import 'package:news_fringe/constants.dart';
import 'package:provider/provider.dart';
class CategoryNews extends StatefulWidget {
  static String id='category';
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(Provider.of<NewsData>(context).appBarTitle,style:kTextStyle.copyWith()),
      ),
      body: ListView.builder(
itemCount: 19,
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
      ),

    );
  }
}


