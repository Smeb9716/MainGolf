import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_main/category_detail.dart';
import 'package:screen_main/table_score.dart';

import 'courses_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: Image.asset('assets/images/ic_menu.png'),
            onPressed: (){
              if (kDebugMode) {
                print('onClick iconMenu');
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TableScore()));
              }
            },
          ),
        ),
        leadingWidth: 50,
        title: const Text('COURES', style: TextStyle(color: Color(0xff414955),  fontFamily: 'SVN-Gilroy', fontWeight: FontWeight.w700, fontSize: 16)),
        titleSpacing: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          print('onRefresh');
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            // height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               _searchBar(),
                const FavoritesCourses(),
                const RecommendedCourses(),
                const NearestCourses()
              ],
            ),
          ),
        ),
      )
    );
  }
}

_searchBar() {
  return Container(
    margin: const EdgeInsets.only(bottom: 32),
    child: TextField(
      autofocus: false,
      onChanged: (searchText) {
        searchText = searchText.toLowerCase();
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Color(0xffD4D9E1)),
        ),
        prefixIcon: const Icon(Icons.search, size: 35, color: Color(0xff414955),),
        hintText: 'Search coures',
        hintStyle: const TextStyle(color: Color(0xff8A8E9B), fontWeight: FontWeight.w500, fontSize: 15, fontFamily: 'SVN-Gilroy'),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff2DBA63)),
          borderRadius: BorderRadius.circular(25.0)
        )
      ),
    ),
  );
}

class FavoritesCourses extends StatelessWidget{
  const FavoritesCourses({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: const [
            CommonHeader(categoryCoures: 'Favorites Courses'),
            CommonBody(),
         ],
       ),
     );
  }
}

class RecommendedCourses extends StatelessWidget{
  const RecommendedCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CommonHeader(categoryCoures: 'Recommended Courses'),
          CommonBody(),
        ],
      ),
    );
  }
}

class NearestCourses extends StatelessWidget{
  const NearestCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CommonHeader(categoryCoures: 'Nearest Courses'),
          CommonBody(),
        ],
      ),
    );
  }
}

class CommonHeader extends StatelessWidget{
  const CommonHeader({super.key, required this.categoryCoures});

  final String categoryCoures;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(categoryCoures, style: const TextStyle(color: Color(0xff414955), fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy')),
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryDetail()));
          },
          child: Row(
            children: const [
              Text('View All', style: TextStyle(color: Color(0xff2DBA63), fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'SVN-Gilroy')),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Color(0xff2DBA63)),
            ],
          ),
        )
      ],
    );
  }
}

class CommonBody extends StatelessWidget{
  const CommonBody({super.key});

  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: 266,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CoursesDetailScreen()))
              },
                child: Container(
                  height: 224,
                  width: 266,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffEEF5FF),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: Image.network('https://picsum.photos/250?image=9', width: 266, height: 170, fit: BoxFit.fill,)
                      ),
                      const Padding(
                          padding: EdgeInsets.only(left: 16, top: 20),
                          child: Text('Hilltop Valley Golf Club ', style: TextStyle(fontSize: 15, fontFamily: 'SVN-Gilroy', fontWeight: FontWeight.w700)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 9),
                        child:  Row(
                          children: [
                            Image.asset('assets/images/ic_golf_course.png', width: 14, height: 14,),
                            const SizedBox(width: 8),
                            const Text('27 holes', style: TextStyle(color: Color(0xff8A8E9B), fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'SVN-Gilroy')),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              );
            }),
      );
  }

}



