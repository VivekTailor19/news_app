import 'package:flutter/material.dart';
import 'package:news_app/provider/newsprovider.dart';
import 'package:news_app/screens/discover_tab/tabbar_Data.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {

  NewsProvider? newsT;
  NewsProvider? newsF;

  @override
  Widget build(BuildContext context) {

    newsT = Provider.of<NewsProvider>(context);
    newsF = Provider.of<NewsProvider>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEFEFEB),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.sp),
                child: Container(height: 11.w,width: double.infinity,
                  child: Row(

                    children: [
                      Expanded(
                        child: TextField(

                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 8.sp),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.search_rounded,color: Color(0xff151924),),
                            hintText: "Find Breaking News",
                            hintStyle: TextStyle(color: Color(0xff151924),fontWeight: FontWeight.w400),

                            enabled: true,
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w),borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2.w),borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                      ),
                      SizedBox(width: 1.w,),
                      Container(height: 11.w,width: 11.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(2.w),color: Colors.white),
                        child: Icon(Icons.sort_rounded,color: const Color(0xff151924),size: 25.sp,),)
                    ],
                  ),
                ),
              ),

              DefaultTabController(

                length: newsF!.categories.length,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      onTap: (value) {
                        newsF!.changetab(value);
                      },

                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 0.2.sp,
                      tabs: const [
                        Tab(text: "Business",),
                        Tab(text: "Entertainment"),
                        Tab(text: "General"),
                        Tab(text: "Health"),
                        Tab(text: "Science"),
                        Tab(text: "Sports"),
                        Tab(text: "Technology"),
                         ],
                      isScrollable: true,
                      indicatorColor: Color(0xff151924),
                      labelColor: Color(0xff151924),
                    ),

                      Container(
                        height: 300.h,
                        width: 100.w,
                        child: const TabBarView(

                          children: [
                            TabbarData(),
                            TabbarData(),
                            TabbarData(),
                            TabbarData(),
                            TabbarData(),
                            TabbarData(),
                            TabbarData(),

                          ],
                        ),
                     ),

                  ],
                ),

              ),



            ],
          ),
        ),

      ),
    );
  }


}
