

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../model/newsInfo_model.dart';
import '../../model/newsModel.dart';
import '../../provider/newsprovider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NewsProvider? newsT;
  NewsProvider? newsF;

  @override
  Widget build(BuildContext context) {
    newsT = Provider.of<NewsProvider>(context);
    newsF = Provider.of<NewsProvider>(context, listen: false);

    return FutureBuilder(
      future: newsF!.loadNews("${newsT!.countrysel}","${newsT!.categorysel}"),
      builder: (context, snapshot) {
        if(snapshot.hasError)
        {
          return Scaffold(body: Center(child: Text("${snapshot.error}"),),);
        }

        else if(snapshot.hasData)
          {
            NewsModel news = snapshot.data!;
            return  SingleChildScrollView(
                child: Stack(
                  fit: StackFit.loose,
                  children: [

                    Container(height: 50.h,width: double.infinity, color: Color(0xff151924),),

                    Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/logosmall.png",fit: BoxFit.fill,height: 25.sp,width: 25.sp,),
                              SizedBox(width: 2.w,),
                              Row(mainAxisSize: MainAxisSize.min,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text("News",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,color: Color(0xffFFFFFF)),),
                                  Text("Feed",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,color: Color(0xffD7D7D8))),
                                ],
                              ),
                              Spacer(),
                              Icon(Icons.notifications_active_outlined,color: Colors.white,)
                            ],
                          ),
                          SizedBox(height: 2.h,),
                          Text("Good Morning! Vivek 😎",style: TextStyle(fontWeight: FontWeight.w300,color: Colors.white,fontSize: 13.sp),),
                          SizedBox(height: 1.h,),
                          Text("Discover Breaking News",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white,fontSize: 18.sp,wordSpacing: -2),),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.sp),
                            child: Container(height: 11.w,width: double.infinity,
                              child: Row(

                                children: [
                                  Expanded(
                                    child: TextField(

                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(bottom: 8.sp),
                                        filled: true,
                                        fillColor: Colors.white54,
                                        prefixIcon: Icon(Icons.search_rounded,color: Colors.white,),
                                        hintText: "Find Breaking News",
                                        hintStyle: TextStyle(color: Colors.white),

                                        enabled: true,
                                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w)),
                                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 1.w,),
                                  Container(height: 11.w,width: 11.w,
                                    alignment: Alignment.center,
                                    child: Icon(Icons.sort_rounded,color: Colors.white,size: 25.sp,),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.w),color: Colors.white54),)
                                ],
                              ),
                            ),
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Breaking News 🔥",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.sp,color: Colors.white),),
                              Text("View All",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15.sp,color: Colors.white),),
                            ],),
                          SizedBox(height: 2.h,),

                          Container(height: 70.w,

                            child: ListView.builder(
                              itemCount:5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    NewsDataInDetails newsRead = NewsDataInDetails(
                                        title: news.articlelist![index].title,
                                        author: news.articlelist![index].author,
                                        url: news.articlelist![index].url,
                                        description: news.articlelist![index].description,
                                        imgUrl: news.articlelist![index].imgUrl,
                                        content: news.articlelist![index].content,
                                        sourcename: news.articlelist![index].sourceModel!.name
                                    );

                                    Navigator.pushNamed(context, "read",arguments: newsRead);

                                  },
                                  child: Container(height: 70.w,width: 70.w,
                                    margin: EdgeInsets.only(right: 10.w),
                                    decoration: BoxDecoration(color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.sp),
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.all(15.sp),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(height: 33.w,width: 60.w,
                                            decoration: BoxDecoration(color: Colors.amber,
                                              borderRadius: BorderRadius.circular(20.sp),
                                              image: DecorationImage(image: NetworkImage(news.articlelist![index].imgUrl==null ? "https://www.openpr.com/wiki/images/56-400x300_4851":"${news.articlelist![index].imgUrl}"),fit: BoxFit.fill)
                                            ),),
                                          Text("${news.articlelist![index].title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13.sp),maxLines: 2,overflow: TextOverflow.ellipsis),
                                          Text("${news.articlelist![index].author}",style: TextStyle(fontWeight:FontWeight.w300,fontSize: 11.sp),maxLines: 1,overflow: TextOverflow.ellipsis),
                                          Spacer(),
                                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("2 Hours ago",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11.sp,color: Colors.black26),),
                                              CircleAvatar(radius: 4.w,backgroundImage: AssetImage("assets/images/logosmall.png"),)
                                            ],
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          SizedBox(height: 2.h,),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Category News",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.sp,),),
                                Text("View All",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15.sp,),),
                              ],),
                          ),

                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            reverse: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  NewsDataInDetails newsRead = NewsDataInDetails(
                                      title: news.articlelist![index].title,
                                      author: news.articlelist![index].author,
                                      url: news.articlelist![index].url,
                                      description: news.articlelist![index].description,
                                      imgUrl: news.articlelist![index].imgUrl,
                                      content: news.articlelist![index].content,
                                      sourcename: news.articlelist![index].sourceModel!.name
                                  );

                                  Navigator.pushNamed(context, "read",arguments: newsRead);

                                },
                                child: Container(
                                  height: 30.w, width: 100.w,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                                        height: 26.w, width: 26.w, decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(3.w), color: Colors.yellow.shade100,
                                            image: DecorationImage(image: NetworkImage(news.articlelist![index].imgUrl==null ? "https://www.openpr.com/wiki/images/56-400x300_4851":"${news.articlelist![index].imgUrl}"),fit: BoxFit.fill)
                                        ),),

                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 2.w),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,


                                          children: [

                                            Container(width: 60.w,
                                              child: Text("${news.articlelist![index].title}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11.sp),softWrap: true,
                                                  maxLines: 2,overflow: TextOverflow.ellipsis),
                                            ),

                                            Row(
                                              children: [
                                                CircleAvatar(radius: 3.w,backgroundImage: AssetImage("assets/images/logosmall.png"),),
                                                Container(width: 54.w,child: Text(news.articlelist![index].author==null?"":"\t${news.articlelist![index].author}",style: TextStyle(fontWeight:FontWeight.w300,fontSize: 13.5.sp),maxLines: 1,overflow: TextOverflow.ellipsis,)),

                                              ],
                                            )
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              );
                              // NewsItem(title: news.articlelist![index].title,
                              //     imgpath: news.articlelist![index].imgUrl,
                              //     author: news.articlelist![index].author);
                            },
                          ),




                          // CachedNetworkImage(
                          //   imageUrl: "http://vigyanprasar.gov.in/isw/images/New-New-researchers-develop-synthetic-vitamin-cofactor.jpg",
                          //   placeholder: (context, url) => CircularProgressIndicator(),
                          //   errorWidget: (context, url, error) => Icon(Icons.error),
                          //   width: 150,
                          //   height: 50,
                          //   fit: BoxFit.fill,
                          // ),

                        ],
                      ),
                    ),

                  ],
                ),
              );
          }

        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },

    );
  }


}

/*

SafeArea(
      child: FutureBuilder(
        future: newsF!.loadNews("in"),
        builder: (context, snapshot) {

          if(snapshot.hasError)
              {
                return Scaffold(body: Center(child: Text("${snapshot.error}"),),);
              }
            else if(snapshot.hasData)
              {
                NewsModel news = snapshot.data!;
               return Scaffold(
                 body: Center(child:
                   Column(
                     children: [
                       Text("Status : ${news.status}"),
                     Text("Total Result : ${news.totalResults}"),
                     Text("Total Articles : ${news.articlelist!.length}"),
                     Expanded(
                       child: ListView.builder(itemBuilder: (context, index) {
                         return ListTile(title: Text("${news.articlelist![index].title}"));
                       },
                           itemCount:news.articlelist!.length ,),
                     )
                   ],
                 ),
                 ),
               );
            }

          return Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      )
    );

*/
