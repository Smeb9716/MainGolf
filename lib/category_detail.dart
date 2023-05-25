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
     );
  }

}