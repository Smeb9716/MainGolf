import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryDetail extends StatelessWidget{
  const CategoryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: ListCoursesDetail(),
    );
  }
}

class ListCoursesDetail extends StatelessWidget{
  const ListCoursesDetail({super.key});

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
               }
             },
           ),
         ),
         leadingWidth: 50,
         title: const Text('COURES', style: TextStyle(color: Color(0xff414955),  fontFamily: 'SVN-Gilroy', fontWeight: FontWeight.w700, fontSize: 16)),
         titleSpacing: 0,
       ),
       body: SafeArea(
         child: Container(
           margin: const EdgeInsets.only(left: 20, right: 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               _searchBar(),
               Padding(
                   padding: EdgeInsets.only(bottom: 10),
                   child: Text('Favorites Courses', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy'))),
               ListItemCourses()
             ],
           ),
         ),
       ),
     );
  }
}

class ListItemCourses extends StatelessWidget{
  const ListItemCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 220,
      child: GridView.count(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2 ,
        children: List.generate(50,(index){
          return GestureDetector(
            onTap: () => {
              debugPrint('$index')
            },
            child: Container(
              margin: EdgeInsets.all(5),
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
                      child: Image.network('https://picsum.photos/250?image=9', width: 200, height: 88, fit: BoxFit.fill,)
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 9, top: 15, right: 10),
                    child: Text('Hilltop Valley Golf Club Hilltop Valley Golf Club', style: TextStyle(fontSize: 14, fontFamily: 'SVN-Gilroy', fontWeight: FontWeight.w600), maxLines: 2, overflow: TextOverflow.ellipsis),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 9, top: 7),
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
