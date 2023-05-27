import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:screen_main/table_score.dart';

import 'account_screen.dart';
import 'category_detail_screen.dart';
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
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.white],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      openScale: 1,
      openRatio: 0.65,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3.0,
          ),
        ],
        // borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      drawer: CustomNavigationDrawer(advancedDrawerController: _advancedDrawerController),
      child: Scaffold(
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
            child: Builder(
              builder: (context) =>
               IconButton(
                icon: Image.asset('assets/images/ic_menu.png'),
                onPressed: (){
                  // Scaffold.of(context).openDrawer();
                  _handleMenuButtonPressed();
                },
              ),
            ),
          ),
          leadingWidth: 50,
          title: const Text('COURSES', style: TextStyle(color: Color(0xff414955),  fontFamily: 'SVN-Gilroy', fontWeight: FontWeight.w700, fontSize: 16)),
          titleSpacing: 0,
        ),
        body: RefreshIndicator(
          onRefresh: () async{
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TableScore()));
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 _searchBar(),
                  const SizedBox(height: 25),
                  const FavoritesCourses(),
                  const SizedBox(height: 20),
                  const RecommendedCourses(),
                  const SizedBox(height: 20),
                  const NearestCourses()
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
   }
}

_searchBar() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: TextField(
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, fontFamily: 'SVN-Gilroy'),
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
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: const [
          CommonHeader(categoryCourses: 'Favorites Courses'),
          CommonBody(),
       ],
     );
  }
}

class RecommendedCourses extends StatelessWidget{
  const RecommendedCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        CommonHeader(categoryCourses: 'Recommended Courses'),
        CommonBody(),
      ],
    );
  }
}

class NearestCourses extends StatelessWidget{
  const NearestCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        CommonHeader(categoryCourses: 'Nearest Courses'),
        CommonBody(),
      ],
    );
  }
}

class CommonHeader extends StatelessWidget{
  const CommonHeader({super.key,  this.categoryCourses = ''});

  final String categoryCourses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(categoryCourses, style: const TextStyle(color: Color(0xff414955), fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy')),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryDetailScreen()));
            },
            child: Row(
              children: const [
                Text('View All', style: TextStyle(color: Color(0xff2DBA63), fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'SVN-Gilroy')),
                SizedBox(width: 3),
                Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Color(0xff2DBA63)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CommonBody extends StatelessWidget{
  const CommonBody({super.key});

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 266,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
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
        ),
      );
  }
}

class CustomNavigationDrawer extends StatelessWidget{
   const CustomNavigationDrawer({super.key, required this.advancedDrawerController});
   final AdvancedDrawerController advancedDrawerController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, top: 25, bottom: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/ic_golf_score_drawer.png', width: 180, height: 51),
                const SizedBox(height: 33),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen()));
                    advancedDrawerController.hideDrawer();
                  },
                  child: Row(
                    children: [
                      Image.asset('assets/images/ic_account.png', height: 30, width: 30),
                      const SizedBox(width: 12),
                      const Text('Account', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414B5B)))
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: (){
                  },
                  child: Row(
                    children: [
                      Image.asset('assets/images/ic_change_password.png', height: 30, width: 30,),
                      const SizedBox(width: 12),
                      const Text('Change password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414B5B)))
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 43,
                      width: 117,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.5),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xff3DE178), Color(0xff2DBA63)],
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 9),
                          Image.asset('assets/images/ic_logout.png', width: 26, height: 26),
                          const SizedBox(width: 9),
                          const Text('Log Out', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400, fontFamily: 'SVN-Gilroy'))
                        ],
                      ),
                    ),
                )
              ],
            ),
          )
      ),
    );
  }

}



