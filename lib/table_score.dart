import 'package:flutter/material.dart';

class TableScore extends StatelessWidget{
  const TableScore({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
         body: Center(
           child: Container(
             margin: const EdgeInsets.all(15.0),
             decoration: BoxDecoration(
               border: Border.all(
                 color: Color(0xffD4D9E1),
                 width: 1.0
               ),
               borderRadius: BorderRadius.circular(4.0)
             ),
             child: Table(
               // border: TableBorder.all(color: Colors.black),
               children: [
                 TableRow(
                     children: [
                        TableCell(
                          child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          child: const Text('PVP\nScore', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                        ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('Handicap\nindex', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy'), textAlign: TextAlign.center)),
                       ),
                       TableCell(
                           child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const CircleAvatar(
                               radius: 15.0,
                               backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
                               backgroundColor: Colors.transparent,
                             ),
                           )
                       ),
                       TableCell(
                           child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const CircleAvatar(
                               radius: 15.0,
                               backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
                               backgroundColor: Colors.transparent,
                             ),
                           )
                       ),
                       TableCell(
                           child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const CircleAvatar(
                               radius: 15.0,
                               backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
                               backgroundColor: Colors.transparent,
                             ),
                           )
                       ),
                       TableCell(
                           child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const CircleAvatar(
                               radius: 15.0,
                               backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
                               backgroundColor: Colors.transparent,
                             ),
                           )
                       ),
                     ],
                   decoration: const BoxDecoration(
                     color: Color(0xffD4D9E1)
                   )
                 ),
                 TableRow(
                     children: [
                   TableCell(
                       child: Container(
                         height: 40,
                         alignment: Alignment.center,
                         decoration: BoxDecoration(
                             color: Color(0xffD4D9E1)
                         ),
                         child: const CircleAvatar(
                           radius: 15.0,
                           backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
                           backgroundColor: Colors.transparent,
                         ),
                       )
                   ),
                   TableCell(
                     child: Container(
                         height: 40,
                         alignment: Alignment.center,
                         child: const Text('11', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                   ),
                   TableCell(
                     child: Container(
                         height: 40,
                         alignment: Alignment.center,
                         child: const Text('-', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                   ),
                   TableCell(
                     child: Container(
                         height: 40,
                         alignment: Alignment.center,
                         child: const Text('-', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                   ),
                   TableCell(
                     child: Container(
                         height: 40,
                         alignment: Alignment.center,
                         child: const Text('1.0', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                   ),
                   TableCell(
                     child: Container(
                         height: 40,
                         alignment: Alignment.center,
                         child: const Text('2.0', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                   ),
                 ]),
                 TableRow(
                     children: [
                       TableCell(
                           child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             decoration: BoxDecoration(
                                 color: Color(0xffD4D9E1)
                             ),
                             child: const CircleAvatar(
                               radius: 15.0,
                               backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
                               backgroundColor: Colors.transparent,
                             ),
                           )
                       ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('12', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                       ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('-', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                       ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('-', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                       ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('1.0', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                       ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('2.0', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                       ),
                     ]),
                 TableRow(
                     children: [
                       TableCell(
                           child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             decoration: BoxDecoration(
                                 color: Color(0xffD4D9E1)
                             ),
                             child: const CircleAvatar(
                               radius: 15.0,
                               backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
                               backgroundColor: Colors.transparent,
                             ),
                           )
                       ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('14', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                       ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('-', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                       ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('-', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                       ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('1.0', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                       ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('2.0', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                       ),
                     ]),
                 TableRow(
                     children: [
                       TableCell(
                           child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             decoration: BoxDecoration(
                                 color: Color(0xffD4D9E1)
                             ),
                             child: const CircleAvatar(
                               radius: 15.0,
                               backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
                               backgroundColor: Colors.transparent,
                             ),
                           )
                       ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('14', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                       ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('-', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                       ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('-', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                       ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('1.0', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                       ),
                       TableCell(
                         child: Container(
                             height: 40,
                             alignment: Alignment.center,
                             child: const Text('2.0', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)),
                       ),
                     ]),

               ],
             ),
           )
         ),
     );
  }

}