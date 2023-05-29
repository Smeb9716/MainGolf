import 'package:flutter/material.dart';

class AddPlayerScreen extends StatefulWidget{
  const AddPlayerScreen({super.key});

  @override
  State<AddPlayerScreen> createState() => _AddPlayerScreenState();

}

class _AddPlayerScreenState extends State<AddPlayerScreen> {

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
              Navigator.pop(context);
          },
        ),
      ),
      leadingWidth: 45,
    );
    final buttonDone = Container(
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
                  child: Text('Done', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'SVN-Gilroy'))
              ),
            ),
          ),
        ),
      ),
    );
    final buttonCancel = Container(
      height: 99,
      // decoration: const BoxDecoration(
      //     color: Color(0xffFCFCFC),
      //     borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Color(0xff555555),
      //         blurRadius: 1,
      //       )]
      // ),
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
    const textPlayer = Text('Players', style: TextStyle(color: Color(0xff414955), fontWeight: FontWeight.w700, fontSize: 18, fontFamily: 'SVN-Gilroy'));
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
                              height: 165,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 29),
                                  const Center(child: Text('Delete', style: TextStyle(color: Color(0xff414955), fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy'))),
                                  const Spacer(),
                                  buttonCancel
                                ],
                              ),
                            );
                          });
                    },
                    child: Image.asset('assets/images/ic_more.png', height: 18)
                )
              ],
            ),
          ),
        );
      },
    );
    final groupListFriends = Row(
      children: [
        const Text('List Friends', style: TextStyle(color: Color(0xff414955), fontWeight: FontWeight.w700, fontSize: 18, fontFamily: 'SVN-Gilroy')),
        const Spacer(),
        Container(
          height: 32,
          width: 125,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color(0xff2DBA63),
              width: 1
            )
          ),
          child: GestureDetector(
            onTap: (){},
            child: Row(
              children: [
                const SizedBox(width: 10),
                Image.asset('assets/images/ic_add_player.png', color: const Color(0xFF2DBA63), height: 20, width: 20),
                const SizedBox(width: 10),
                const Text('Add Guest', style: TextStyle(color: Color(0xFF2DBA63), fontWeight: FontWeight.w600, fontSize: 14, fontFamily: 'SVN-Gilroy')),
              ],
            ),
          ),
        )
      ],
    );
    final searchFriend = SizedBox(
      height: 36,
      child: TextField(
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(7.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Color(0xffD4D9E1)),
            ),
            prefixIcon: const Icon(Icons.search, size: 30, color: Color(0xff414955),),
            hintText: 'Search friend',
            hintStyle: const TextStyle(color: Color(0xff8A8E9B), fontWeight: FontWeight.w500, fontSize: 15, fontFamily: 'SVN-Gilroy'),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff2DBA63)),
                borderRadius: BorderRadius.circular(5.0)
            )
        ),
      ),
    );
    final listFriend = ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/avatar.png'),
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
                        child: const Text('12', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white)),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Hoang Van Giang', style: TextStyle(fontSize: 14, color: Color(0xff414955), fontWeight: FontWeight.w600, fontFamily: 'SVN-Gilroy')),
                    Text('ID: 13124', style: TextStyle(fontSize: 14, color: Color(0xff8A8E9B), fontWeight: FontWeight.w400, fontFamily: 'SVN-Gilroy'))
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){},
                  child: Image.asset('assets/images/ic_add_friend.png', height: 20, width: 20),
                )
              ],
            ),
          );
        }
    );

    return Scaffold(
       resizeToAvoidBottomInset: false,
       appBar: appBar,
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
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
                       textPlayer,
                       const SizedBox(height: 12),
                       listUser,
                       const SizedBox(height: 23.5),
                       groupListFriends,
                       const SizedBox(height: 16),
                       searchFriend,
                       const SizedBox(height: 22),
                       listFriend


                     ],
                   ),
                 ),
               )
           ),
           Expanded(
               flex: 1,
               child: buttonDone
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