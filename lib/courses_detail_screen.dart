import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CoursesDetailScreen extends StatefulWidget {
  const CoursesDetailScreen({Key? key}) : super(key: key);

  @override
  State<CoursesDetailScreen> createState() => _CoursesDetailScreenState();
}

class _CoursesDetailScreenState extends State<CoursesDetailScreen> {
  List<String> listButtonOut = ['A', 'B', 'C', 'D', 'E', 'F'];
  List<String> listButtonIn = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  int outSelected = 0;
  int inSelected = 0;

  int formatPlayIndex = 0;

  List<User> listUserData = [
    User('Nguyen Van A', 'assets/images/avatar.png', UserStatus.red, 10),
    User('Nguyen Van B', 'assets/images/avatar.png', UserStatus.blue, 15),
    User('Nguyen Van C', 'assets/images/avatar.png', UserStatus.orange, 12),
  ];

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
            if (kDebugMode) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      leadingWidth: 45,
    );
    final buttonStartRound = Container(
      decoration: const BoxDecoration(
          color: Color(0xffFCFCFC),
          borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Color(0xff555555),
              blurRadius: 1,
            )]),
      child: GestureDetector(
        onTap: (){},
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff3DE178), Color(0xff2DBA63)],
                  ),
                  borderRadius: BorderRadius.circular(25)
              ),
              child: const Center(
                  child: Text('Start Round', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'SVN-Gilroy'))
              ),
            ),
          ),
        ),
      ),
    );
    final buttonCancel = Container(
      height: 99,
      decoration: const BoxDecoration(
          color: Color(0xffFCFCFC),
          borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Color(0xff555555),
              blurRadius: 1,
            )]
      ),
      child: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              height: 48,
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
                  child: Text('Cancel', style: TextStyle(color: Color(0xff2DBA63), fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'SVN-Gilroy'))
              ),
            ),
          ),
        ),
      ),
    );
    const roundSettingTitle = Text('Round Settings', style: TextStyle(color: Color(0xff414955), fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy'));
    final outGroupButton = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        const Text('OUT', style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'SVN-Gilroy', fontSize: 14, color: Color(0xFF2DBA63)),),
        const SizedBox(height: 8),
        SizedBox(
          height: 28,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: listButtonOut.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 80,
                  margin: const EdgeInsets.only(right: 8),
                  child: customButton(
                      title: listButtonOut[index],
                      isSelected: outSelected == index,
                      onTap: () {
                        outSelected = index;
                        setState(() {});
                      }),
                );
              }
          ),
        )
      ],
    );
    final inGroupButton = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        const Text('IN', style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'SVN-Gilroy', fontSize: 14, color: Color(0xFF2DBA63)),),
        const SizedBox(height: 8),
        SizedBox(
          height: 28,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: listButtonIn.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 80,
                  margin: const EdgeInsets.only(right: 8),
                  child: customButton(
                      title: listButtonIn[index],
                      isSelected: inSelected == index,
                      onTap: () {
                        inSelected = index;
                        setState(() {});
                      }),
                );
              }
          ),
        )
      ],
    );
    final roundSettingGroupTitle = Row(
      children:  [
        const Text('Round Settings', style: TextStyle(color: Color(0xff414955), fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy')),
        const Spacer(),
        GestureDetector(
          onTap: (){},
          child: const Text('Starting Tee', style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'SVN-Gilroy', fontSize: 14, color: Color(0xFF2DBA63)))
        ),
      ],
    );
    final listUser = ListView.builder(
      itemCount: listUserData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            await showModalBottomSheet<String>(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              ),
              backgroundColor: Colors.white,
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 321,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: bottomSheetItem(userStatus: UserStatus.red)
                      ),
                      const SizedBox(height: 24),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: bottomSheetItem(userStatus: UserStatus.blue)
                      ),
                      const SizedBox(height: 24),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: bottomSheetItem(userStatus: UserStatus.black)
                      ),
                      const SizedBox(height: 24),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: bottomSheetItem(userStatus: UserStatus.orange)
                      ),
                      const Spacer(),
                      buttonCancel
                    ],
                  ),
                );
              },
            ).then((value) {
              listUserData[index].status = UserStatus.values
                  .firstWhere((element) => element.value == value as String);
              setState(() {});
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(listUserData[index].avatar),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Text(listUserData[index].score.toString(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white)),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(listUserData[index].name, style: const TextStyle(fontSize: 16, fontFamily: 'SVN-Gilroy', fontWeight: FontWeight.w600, color: Color(0xFF414955))),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              color: Color(listUserData[index].status.color),
                              shape: BoxShape.circle),
                        ),
                        const SizedBox(width: 4),
                        Text(listUserData[index].status.value, style: TextStyle(fontFamily: 'SVN-Gilroy', fontSize: 16, fontWeight: FontWeight.w500, color: Color(listUserData[index].status.color))),
                        const SizedBox(width: 4),
                        Image.asset('assets/images/ic_drop_down_arrow.png', height: 16, width: 16)
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Image.asset('assets/images/ic_more.png', height: 12)
              ],
            ),
          ),
        );
      },
    );
    final addPlayerButton = GestureDetector(
        onTap: (){},
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xFF2DBA63), width: 1)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/ic_add_player.png', color: const Color(0xFF2DBA63), height: 20, width: 20),
                const SizedBox(width: 4),
                const Text('Add Player', style: TextStyle(color: Color(0xFF2DBA63), fontSize: 14, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
      );
    const formatOfPlay = Text('Format of play', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy', color: Color(0xff414955)));
    final groupSelectBox = Row(
      children: [
        Expanded(
            flex: 2,
            child: selectButton(
                onTap: () {
                  formatPlayIndex = 0;
                  setState(() {});
                },
                isSelected: formatPlayIndex == 0,
                title: 'Stroke-Play')),
        Expanded(
          flex: 3,
          child: selectButton(
              onTap: () {
                formatPlayIndex = 1;
                setState(() {});
              },
              isSelected: formatPlayIndex == 1,
              title: 'Match-Play'),
        ),
      ],
    );
     return Scaffold(
       resizeToAvoidBottomInset: false,
       appBar: appBar,
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children:  [
           Expanded(
               flex: 9,
               child: SingleChildScrollView(
                 physics: const BouncingScrollPhysics(),
                 child: Padding(
                   padding: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const SizedBox(height: 24),
                       roundSettingTitle,
                       const SizedBox(height: 16),
                       outGroupButton,
                       const SizedBox(height: 12),
                       inGroupButton,
                       const SizedBox(height: 40),
                       roundSettingGroupTitle,
                       const SizedBox(height: 20),
                       listUser,
                       const SizedBox(height: 12),
                       Divider(color: const Color(0xFFD4D9E1).withOpacity(0.7), height: 1, thickness: 1),
                       const SizedBox(height: 20),
                       addPlayerButton,
                       const SizedBox(height: 35),
                       formatOfPlay,
                       const SizedBox(height: 16),
                       groupSelectBox
                     ],
                   ),
                 ),
               )
           ),
           Expanded(
               flex: 1,
               child: buttonStartRound
           )
         ],
       ),
     );
  }

  Widget bottomSheetItem({required UserStatus userStatus}) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, userStatus.value);
      },
      child: Row(
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
                color: Color(userStatus.color), shape: BoxShape.circle),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            userStatus.value,
            style: TextStyle(
                fontFamily: 'SVN-Gilroy',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(userStatus.color)),
          ),
        ],
      ),
    );
  }

  Widget customButton({required String title, required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color:
              isSelected ? const Color(0xFF2DBA63) : const Color(0xFFB0EFC8)),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 32),
          child: Text(title,
            style: TextStyle(
                color: isSelected
                    ? const Color(0xFFFFFFFF)
                    : const Color(0xFF2DBA63),
                fontWeight: FontWeight.w700,
                fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget selectButton({required String title, required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(
                width: 6,
                color: const Color(0xFF2DBA63),
              )
                  : Border.all(width: 1, color: Color(0xffD9D9D9)),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xFF414955),
                fontFamily: 'SVN-Gilroy'),
          )
        ],
      ),
    );
  }
}

class User {
  String name;
  String avatar;
  UserStatus status;
  int score;

  User(this.name, this.avatar, this.status, this.score);
}

enum UserStatus {
  red("Red", 0xFFE24955),
  blue("Blue", 0xFF0286E0),
  orange("Orange", 0xFFFF8F27),
  black("Black", 0xFF414955);

  final String value;
  final int color;

  const UserStatus(this.value, this.color);
}