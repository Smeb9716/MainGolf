import 'package:flutter/material.dart';

class TableScore extends StatelessWidget{
  const TableScore({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.white,
           elevation: 0,
           centerTitle: false,
           leading: Padding(
             padding: const EdgeInsets.only(left: 20),
             child: IconButton(
               icon: Image.asset('assets/images/ic_back.png'),
               onPressed: (){
                   Navigator.pop(context);
               },
             ),
           ),
           leadingWidth: 45,
         ),
         body: SingleChildScrollView(
           physics: BouncingScrollPhysics(),
           child: Padding(
             padding: const EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: const [
                 GroupScore(),
                 SizedBox(height: 11),
                 TablePVPScore(),
                 SizedBox(height: 31),
                 TablePVPScore(),
                 SizedBox(height: 32),
                 Text('Team Score', style: TextStyle(fontFamily: 'SVN-Gilroy', fontWeight: FontWeight.w700, fontSize: 18)),
                 SizedBox(height: 12),
                 TableTeamScore(),
                 SizedBox(height: 30),
                 SummaryScore()
               ],
             ),
           ),
         ),
     );
  }
}

class SummaryScore extends StatelessWidget{
  const SummaryScore({super.key});

  @override
  Widget build(BuildContext context) {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         const Text('Summary', style: TextStyle(fontFamily: 'SVN-Gilroy', fontWeight: FontWeight.w700, fontSize: 18, color: Color(0xff414955))),
         const SizedBox(height: 12),
         const Text('Fairway Hit', style: TextStyle(fontFamily: 'SVN-Gilroy', fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xff414955))),
         const SizedBox(height: 8),

         // Horizontal Bar Chart stacked in one bar chart
         ClipRRect(
           borderRadius: BorderRadius.circular(30),
           child: Row(
             children: [
               Expanded(
                   flex: 25,
                   child: Container(
                     height: 28,
                     color: const Color(0xff65EF9C),
                   )),
               Expanded(
                   flex: 50,
                   child: Container(
                     height: 28,
                     color: const Color(0xff65C2F6),
                   )),
               Expanded(
                   flex: 25,
                   child: Container(
                     height: 28,
                     color: const Color(0xffFD7E7E),
                   ))
             ],
           ),
         ),
       ],
     );
  }

}

class TablePVPScore extends StatelessWidget{
  const TablePVPScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffD4D9E1),
            width: 1.5
          ),
          borderRadius: BorderRadius.circular(4.0)
        ),
      child: Table(
        border: const TableBorder(horizontalInside: BorderSide(color: Color(0xffD4D9E1))),
        children: const [
          TableRow(
            children: [
              TableCell(child: CustomTableCell(isBackgroundColor: 3, isContent: 2, isSize: false, content: 'PVP\nScore')),
              TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 3, isSize: false, content: 'Handicap\nindex')),
              TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
              TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 1, content: 'http://via.placeholder.com/350x150')),
              TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
              TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 2, isSize: true, content: '11')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '1.0')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '2.0')),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 2, isSize: true, content: '11')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '1.0')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '2.0')),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 2, isSize: true, content: '12')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '2.0')),
            ],
          ),
          TableRow(
            children: [
              TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 2, isSize: true, content: '14')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
            ],
          ),
        ],
      )
    );
  }
}

class TableTeamScore extends StatelessWidget{
  const TableTeamScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Color(0xffD4D9E1),
                width: 1.5
            ),
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Table(
          border: const TableBorder(horizontalInside: BorderSide(color: Color(0xffD4D9E1))),
          children: const [
            TableRow(
              children: [
                TableCell(child: CustomTableCell(isBackgroundColor: 3, isContent: 2, isSize: true, content: 'TEAM')),
                TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 2, isSize: true, content: '1')),
                TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 2, isSize: true, content: '2')),
                TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 2, isSize: true, content: '3')),
                TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 2, isSize: true, content: '4')),
                TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 2, isSize: true, content: '5')),
                TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 2, isSize: true, content: '6')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '5')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '5')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '5')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: CustomTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '5')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: CustomTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              ],
            ),
          ],
        )
    );
  }
}

// isBackground: 1 -> white, 2 -> 0xffe5e8ed, 3 -> 0xffD4D9E1
// isContent: 1 -> avatar, 2 -> Text weight700, 3 -> Text weight500
// isSize: true -> size14, false -> size12
// full Text color: #414955
class CustomTableCell extends StatelessWidget{
  const CustomTableCell({super.key, this.isBackgroundColor = 1, this.isContent = 1, this.isSize = true, this.content = ''});
  final int isBackgroundColor;
  final int isContent;
  final bool isSize;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
       height: 40,
       alignment: Alignment.center,
       decoration: isBackgroundColor == 1 ?
       const BoxDecoration(
          color: Colors.white
         ) : (
       isBackgroundColor == 2 ?
       const BoxDecoration(
           color: Color(0xffe5e8ed)
         ) :
       const BoxDecoration(
           color: Color(0xffD4D9E1)
         )
       ),
      child: isContent == 1 ?
       CircleAvatar(
        radius: 15.0,
        backgroundImage: NetworkImage(content),
        backgroundColor: Colors.transparent,
      ) : (
          isContent == 2 ?
          (isSize == true ? Text(content, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)
          : Text(content, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)
          )
          : (isSize == true ? Text(content, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)
              : Text(content, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)), textAlign: TextAlign.center)
          )
      ),
    );
  }

}

class GroupScore extends StatelessWidget{
  const GroupScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('SCORE', style: TextStyle(fontFamily: 'SVN-Gilroy', fontWeight: FontWeight.w700, fontSize: 18)),
        const SizedBox(width: 8),
        GestureDetector(
            onTap: (){
            },
            child: Image.asset('assets/images/ic_info.png', height: 18, width: 18)
        ),
        const Spacer(),
        GestureDetector(
            onTap: (){
            },
            child: Image.asset('assets/images/ic_rotate_score.png', height: 26, width: 26)
        )
      ],
    );
  }
}
