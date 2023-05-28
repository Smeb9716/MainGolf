import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryDetailScreen extends StatefulWidget{
  const CategoryDetailScreen({super.key});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
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
          },
        ),
      ),
      leadingWidth: 50,
      title: const Text('COURSES', style: TextStyle(color: Color(0xff414955),  fontFamily: 'SVN-Gilroy', fontWeight: FontWeight.w700, fontSize: 16)),
      titleSpacing: 0,
    );
    final searchBar = TextField(
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
          hintText: 'Search courses',
          hintStyle: const TextStyle(color: Color(0xff8A8E9B), fontWeight: FontWeight.w500, fontSize: 15, fontFamily: 'SVN-Gilroy'),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff2DBA63)),
              borderRadius: BorderRadius.circular(25.0)
          )
      ),
    );
    const titleCategory = Text('Favorites Courses', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy'));
    final listCoursesCategory = SizedBox(
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2 ,
        shrinkWrap: true,
        children: List.generate(50,(index){
          return itemCourses(urlImage: 'https://picsum.photos/250?image=9', titleCourses: 'Hilltop Valley Golf Club Hilltop Valley Golf Club', countHoles: 28, index: index);
        }),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBar,
            const SizedBox(height: 30),
            titleCategory,
            const SizedBox(height: 10),
            listCoursesCategory
          ],
          )
        ),
      ),
    );
  }

  Widget itemCourses({required String urlImage, required String titleCourses, required int countHoles, required int index}){
    return GestureDetector(
      onTap: () => {
        debugPrint('$index')
      },
      child: Container(
        margin: const EdgeInsets.only(right: 7, bottom: 10),
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
                child: Image.network(urlImage, width: 200, height: 88, fit: BoxFit.fill,)
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9, top: 15, right: 10),
              child: Text(titleCourses, style: const TextStyle(fontSize: 14, fontFamily: 'SVN-Gilroy', fontWeight: FontWeight.w600), maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9, top: 7),
              child:  Row(
                children: [
                  Image.asset('assets/images/ic_golf_course.png', width: 14, height: 14,),
                  const SizedBox(width: 8),
                  Text('$countHoles holes', style: const TextStyle(color: Color(0xff8A8E9B), fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'SVN-Gilroy')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
