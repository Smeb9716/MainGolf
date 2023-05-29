import 'package:flutter/material.dart';
import 'package:screen_main/table_score_detail_screen.dart';


class TableScoreScreen extends StatefulWidget{
  const TableScoreScreen({super.key});

  @override
  State<TableScoreScreen> createState() => _TableScoreScreenState();

}

class _TableScoreScreenState extends State<TableScoreScreen> {

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
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
    );
    final buttonFinishRoundAndEditScore = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
          color: Color(0xffFCFCFC),
          borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Color(0xff555555),
              blurRadius: 1,
            )]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){},
            child: Container(
              height: 40,
              width: 160,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff3DE178), Color(0xff2DBA63)],
                  ),
                  borderRadius: BorderRadius.circular(25)
                      ),
              child: const Center(
                child: Text('Finish round', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'SVN-Gilroy')),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              height: 40,
              width: 160,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xffFCFCFC), Color(0xffFCFCFC)],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: const Color(0xff2DBA63))
              ),
              child: const Center(
                child: Text('Edit score', style: TextStyle(color: Color(0xff2DBA63), fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'SVN-Gilroy')),
              ),
            ),
          ),

        ],
      ),
    );
    final groupScore = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('SCORE', style: TextStyle(fontFamily: 'SVN-Gilroy', fontWeight: FontWeight.w700, fontSize: 18)),
        const SizedBox(width: 8),
        GestureDetector(
            onTap: (){
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                  ),
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(child: Container(
                              height: 48,
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                                color: Color(0xffEEEEEF)
                              ),
                              child: Row(
                                children:  [
                                    const Text('Note', style: TextStyle(color: Color(0xff414B5B), fontWeight: FontWeight.w700, fontSize: 18, fontFamily: 'SVN-Gilroy')),
                                    const Spacer(),
                                    GestureDetector(
                                        onTap: (){
                                          Navigator.pop(context);
                                        },
                                        child: const Icon(Icons.close_sharp),
                                    )
                                ],
                              ),
                            )),
                          Container(
                            padding: const EdgeInsets.only(left: 24, right: 55, top: 34),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  baseTextInfo(title: 'CH', content: 'total handicap'),
                                  const SizedBox(height: 3),
                                  baseTextInfo(title: 'SK', content: 'total score of holes, calculated from OV, TP and PVP score'),
                                  const SizedBox(height: 3),
                                  baseTextInfo(title: 'TP', content: 'total reward and punishment'),
                                  const SizedBox(height: 3),
                                  baseTextInfo(title: 'TO', content: 'final total score')
                              ],
                            )
                          )
                        ],
                      ),
                    );
                  });
            },
            child: Image.asset('assets/images/ic_info.png', height: 18, width: 18)
        ),
        const Spacer(),
        GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TableScoreDetailScreen()));
            },
            child: Image.asset('assets/images/ic_rotate_score.png', height: 26, width: 26)
        )
      ],
    );
    final tableHole = Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color(0xffD4D9E1),
                width: 1.5
            ),
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Table(
          border: const TableBorder(horizontalInside: BorderSide(color: Color(0xffD4D9E1))),
          children:  [
            TableRow(
              children: [
                TableCell(child: baseTableCell(isBackgroundColor: 3, isContent: 2, isSize: false, content: 'PVP\nScore')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 3, isSize: false, content: 'Handicap\nindex')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'http://via.placeholder.com/350x150')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 2, isSize: true, content: '11')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '1.0')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '2.0')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 2, isSize: true, content: '11')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '1.0')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '2.0')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 2, isSize: true, content: '12')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '2.0')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 2, isSize: true, content: '14')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              ],
            ),
          ],
        )
    );
    final tablePVPScore = Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color(0xffD4D9E1),
                width: 1.5
            ),
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Table(
          border: const TableBorder(horizontalInside: BorderSide(color: Color(0xffD4D9E1))),
          children:  [
            TableRow(
              children: [
                TableCell(child: baseTableCell(isBackgroundColor: 3, isContent: 2, isSize: false, content: 'PVP\nScore')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 3, isSize: false, content: 'Handicap\nindex')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'http://via.placeholder.com/350x150')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 2, isSize: true, content: '11')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '1.0')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '2.0')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 2, isSize: true, content: '11')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '1.0')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '2.0')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 2, isSize: true, content: '12')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '2.0')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 2, isSize: true, content: '14')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              ],
            ),
          ],
        )
    );
    const titleTeamScore =  Text('Team Score', style: TextStyle(fontFamily: 'SVN-Gilroy', fontWeight: FontWeight.w700, fontSize: 18));
    final tableTeamScore = Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Color(0xffD4D9E1),
                width: 1.5
            ),
            borderRadius: BorderRadius.circular(4.0)
        ),
        child: Table(
          border: const TableBorder(horizontalInside: BorderSide(color: Color(0xffD4D9E1))),
          children: [
            TableRow(
              children: [
                TableCell(child: baseTableCell(isBackgroundColor: 3, isContent: 2, isSize: true, content: 'TEAM')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 2, isSize: true, content: '1')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 2, isSize: true, content: '2')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 2, isSize: true, content: '3')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 2, isSize: true, content: '4')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 2, isSize: true, content: '5')),
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 2, isSize: true, content: '6')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '5')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '5')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '5')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: baseTableCell(isBackgroundColor: 2, isContent: 1, content: 'https://picsum.photos/250?image=9')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '5')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-5')),
                TableCell(child: baseTableCell(isBackgroundColor: 1, isContent: 3, isSize: true, content: '-')),
              ],
            ),
          ],
        )
    );
    final summaryScore = Column(
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
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            baseRate(colorFairwayHit: 0xff65EF9C, currentFairwayHit: 5, totalFairwayHit: 20.0, positionFairwayHit: 'Left'),
            baseRate(colorFairwayHit: 0xff65C2F6, currentFairwayHit: 10, totalFairwayHit: 20.0, positionFairwayHit: 'Fairway'),
            baseRate(colorFairwayHit: 0xffFD7E7E, currentFairwayHit: 5, totalFairwayHit: 20.0, positionFairwayHit: 'Right')
          ],
        )
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 9,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, top: 5, right: 24, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      groupScore,
                      const SizedBox(height: 11),
                      tableHole,
                      const SizedBox(height: 31),
                      tablePVPScore,
                      const SizedBox(height: 31),
                      titleTeamScore,
                      const SizedBox(height: 12),
                      tableTeamScore,
                      const SizedBox(height: 30),
                      summaryScore
                    ],
                  ),
                ),
              )
          ),
          Expanded(
              flex: 1,
              child: buttonFinishRoundAndEditScore
          )
        ],
      ),
    );
  }

  Widget baseTextInfo({required String title, required String content}){
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: title, style: const TextStyle(color: Color(0xffD65151), fontSize: 14, fontWeight: FontWeight.w600, fontFamily: 'SVN-Gilroy')),
          const TextSpan(text: ': ', style: TextStyle(color: Color(0xff343B46), fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy')),
          TextSpan(text: content, style: const TextStyle(color: Color(0xff343B46), fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy')),
        ],
      ),
    );
  }

// isBackground: 1 -> white, 2 -> 0xffe5e8ed, 3 -> 0xffD4D9E1
// isContent: 1 -> avatar, 2 -> Text weight700, 3 -> Text weight500
// isSize: true -> size14, false -> size12
// full Text color: #414955
  Widget baseTableCell({required int isBackgroundColor, required int isContent, bool isSize = true, required String content}){
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

  Widget baseRate({required int colorFairwayHit, required int currentFairwayHit, required double totalFairwayHit, required String positionFairwayHit}){
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 15,
                height: 15,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Color(colorFairwayHit)
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text('${currentFairwayHit/totalFairwayHit*100}%', style: const TextStyle(color: Color(0xff414955), fontSize: 12, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy'))
            ],
          ),
          const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Text('$positionFairwayHit $currentFairwayHit/${totalFairwayHit.toInt()}', style: const TextStyle(color: Color(0xff414955), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'SVN-Gilroy'))
          )
        ],
      ),
    );
  }
}