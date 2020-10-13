import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'News.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class NewsData extends ChangeNotifier{
final _auth=FirebaseAuth.instance;
final _store=Firestore.instance;

String searchKeyWord;
  String title;
List<News> BookmarkList=[];
  String description;
  String content;
  String link;
  var time;
  String author;
  String appBarTitle;
  String urlToImage;
  String Image;
  List<News> NewsList;
  void getNewsScreenData(String Title,String Desc,String Content,var Time,var URLToImagae,String Link)
  {
    title=Title;
    description=Desc;
    content=(Content==null)?'':Content;
    time=Time;
    urlToImage=URLToImagae;
    link=Link;
    print(urlToImage);
notifyListeners();

  }

  void getListNews(List<News>list,String title )
  {NewsList=list;
appBarTitle=title;
    notifyListeners();
  }
  void bookmarkNews(News news)async
  {
    BookmarkList.add(news);
    final user= await _auth.currentUser();
    if (user!=null)
      {
        await _store.collection('${user.email}').add({
          'title':news.title,
          'content':news.content,
          'description':news.description,
          'imageUrl':news.urlToImage,
          'url':news.url,
          'time':news.time,

        }).whenComplete((){print('upload completed');});

      }
    notifyListeners();

  }

}