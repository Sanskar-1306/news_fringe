import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_fringe/constants.dart';
import 'screens/loading_screen.dart';
import 'screens/news_screen.dart';
import 'dart:convert';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:news_fringe/cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_fringe/cards.dart';
import 'package:news_fringe/News.dart';
import 'package:news_fringe/news_data.dart';
import 'package:provider/provider.dart';

class SilverDelegate extends SliverPersistentHeaderDelegate{
 double maxHeight;
 double minHeight;
 Widget child;
 SilverDelegate(this.minHeight,this.maxHeight,this.child);
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return SizedBox(child: child) ;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}

class SilverScroll extends StatelessWidget {
  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SilverDelegate(
         30.0,
         50.0,
         Container(
            color:kBackgroundC0lor, child: Center(child:
        Text(headerText,style: kHeadingTextStyle.copyWith(color: Colors.black),))),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(

      slivers: <Widget>[



makeHeader('World'),
    SliverFixedExtentList(
    itemExtent: 150.0,
    delegate: SliverChildListDelegate(
    [
      ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 9,
          itemBuilder: (BuildContext context,int index)

          {
            return NewsCard(LoadingScreen.imageUrl[index], LoadingScreen.title[index],LoadingScreen.time[index],LoadingScreen.content[index],LoadingScreen.description[index],LoadingScreen.link[index]);

          }

      ),


    ]
    ),),

makeHeader('Google India'),
        SliverFixedExtentList(
          itemExtent: 150.0,
          delegate: SliverChildListDelegate(
            [
              CarouselSlider(
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


              ]
          ),
        ),
        makeHeader('India'),

        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

            maxCrossAxisExtent: MediaQuery.of(context).size.height,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 0),
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
            },
            childCount: 19,
          ),
        )

      ],

    );
  }
}
