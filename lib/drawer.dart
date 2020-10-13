import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_fringe/screens/loading_screen.dart';
import 'news_data.dart';
import 'package:news_fringe/screens/categoryNews.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
elevation: 5,
        
        child: Container(
          child: Column(mainAxisSize: MainAxisSize.max,

            children: <Widget>[
Image(image: NetworkImage('https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/GfRLKaE/videoblocks-world-news-background-business-concept-2_bieq0ayrm_thumbnail-small01.jpg'))
            ,  GestureDetector(
                  onTap: (){
                    Provider.of<NewsData>(context,listen: false).getListNews(LoadingScreen.businessList,'Business');
                    Navigator.pushNamed(context, CategoryNews.id);

                  },
                  child: NavListTile(Icon(Icons.business),Text('Business',style: kHeadingTextStyle,),))
              ,
              GestureDetector(
                  onTap: (){
                    Provider.of<NewsData>(context,listen: false).getListNews(LoadingScreen.entertaintmentList,'Entertainment');
                    Navigator.pushNamed(context, CategoryNews.id);

                  },
                  child: NavListTile(Icon(Icons.camera_roll),Text('Entertaintment',style: kHeadingTextStyle,))),
              GestureDetector(
                onTap: (){
                  Provider.of<NewsData>(context,listen: false).getListNews(LoadingScreen.science,'Science');
                  Navigator.pushNamed(context, CategoryNews.id);

                },
                child: NavListTile(Icon(Icons.face),Text('Science',style: kHeadingTextStyle,)
                ,
                ),
              ),
              GestureDetector(
                  onTap: (){
                    Provider.of<NewsData>(context,listen: false).getListNews(LoadingScreen.health,'Health');
                    Navigator.pushNamed(context, CategoryNews.id);

                  },
                  child: NavListTile(Icon(Icons.directions_run),Text('Health',style: kHeadingTextStyle,))),
              GestureDetector(
                  onTap: (){
                    Provider.of<NewsData>(context,listen: false).getListNews(LoadingScreen.sports,"Sports");
                    Navigator.pushNamed(context, CategoryNews.id);

                  },
                  child: NavListTile(Icon(Icons.videogame_asset),Text('Sports',style: kHeadingTextStyle,))),
              GestureDetector(

                  onTap: (){
                    Provider.of<NewsData>(context,listen: false).getListNews(LoadingScreen.technology,'Technology');
                    Navigator.pushNamed(context, CategoryNews.id);

                  },
                  child: NavListTile(Icon(Icons.wifi),Text('Technology',style: kHeadingTextStyle,))),


              
            ],


          ),
        ),

      ),
    );
  }
}

class NavListTile extends StatelessWidget {
  Icon icon;
  Text text;
NavListTile(this.icon,this.text);
  @override
  Widget build(BuildContext context) {
    return ListTile(leading: icon,
    title: text,);
  }
}
