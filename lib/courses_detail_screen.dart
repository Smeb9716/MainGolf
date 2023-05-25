import 'package:flutter/material.dart';

class CoursesDetailScreen extends StatefulWidget {
  const CoursesDetailScreen({Key? key}) : super(key: key);

  @override
  State<CoursesDetailScreen> createState() => _CoursesDetailScreenState();
}

class _CoursesDetailScreenState extends State<CoursesDetailScreen> {
  final paddingScreen = const EdgeInsets.symmetric(horizontal: 24);
  final primaryTextStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'SVN-Gilroy');
  final secondTextStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'SVN-Gilroy',
      fontSize: 14,
      color: Color(0xFF2DBA63));
  List<String> listButton = ['A', 'B', 'C', 'D'];
  List<User> listUserData = [
    User('Nguyen Van A', 'assets/images/avatar.png', UserStatus.red, 10),
    User('Nguyen Van A', 'assets/images/avatar.png', UserStatus.blue, 10),
    User('Nguyen Van A', 'assets/images/avatar.png', UserStatus.orange, 10)
  ];
  int inSelected = 0;
  int outSelected = 0;
  int formatPlayIndex = 0;

  @override
  Widget build(BuildContext context) {
    final addPlayerButton = Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xFF2DBA63), width: 1)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/ic_add_player.png',
            color: const Color(0xFF2DBA63),
            height: 20,
            width: 20,
          ),
          const SizedBox(
            width: 4,
          ),
          const Text(
            'Add Player',
            style: TextStyle(
                color: Color(0xFF2DBA63),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
    final inGroupButton = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'IN',
          style: secondTextStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: List<Widget>.generate(
            listButton.length,
            (index) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: customButton(
                    title: listButton[index],
                    isSelected: inSelected == index,
                    onTap: () {
                      inSelected = index;
                      setState(() {});
                    }),
              ),
            ),
          ),
        )
      ],
    );
    final outGroupButton = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OUT',
          style: secondTextStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: List<Widget>.generate(
            listButton.length,
            (index) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: customButton(
                    title: listButton[index],
                    isSelected: outSelected == index,
                    onTap: () {
                      outSelected = index;
                      setState(() {});
                    }),
              ),
            ),
          ),
        )
      ],
    );
    final roundSettingTitle = Text(
      'Round Settings',
      style: primaryTextStyle,
    );
    final roundSettingGroupTitle = Row(
      children: [
        Text(
          'Round Settings',
          style: primaryTextStyle,
        ),
        const Spacer(),
        Text(
          'Starting Tee',
          style: secondTextStyle,
        ),
      ],
    );
    final listUser = ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            await showModalBottomSheet<String>(
              context: context,
              builder: (context) {
                return Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: paddingScreen,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        bottomSheetItem(userStatus: UserStatus.red),
                        const SizedBox(
                          height: 24,
                        ),
                        bottomSheetItem(userStatus: UserStatus.blue),
                        const SizedBox(
                          height: 24,
                        ),
                        bottomSheetItem(userStatus: UserStatus.black),
                        const SizedBox(
                          height: 24,
                        ),
                        bottomSheetItem(userStatus: UserStatus.orange),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
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
                        child: Text(
                          listUserData[index].score.toString(),
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listUserData[index].name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'SVN-Gilroy',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF414955)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              color: Color(listUserData[index].status.color),
                              shape: BoxShape.circle),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          listUserData[index].status.value,
                          style: TextStyle(
                              fontFamily: 'SVN-Gilroy',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(listUserData[index].status.color)),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Image.asset(
                          'assets/images/ic_drop_down_arrow.png',
                          height: 16,
                          width: 16,
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Image.asset(
                  'assets/images/ic_more.png',
                  height: 12,
                )
              ],
            ),
          ),
        );
      },
      itemCount: listUserData.length,
    );
    final groupSelectBox = Row(
      children: [
        Expanded(
            child: selectButton(
                onTap: () {
                  formatPlayIndex = 0;
                  setState(() {});
                },
                isSelected: formatPlayIndex == 0,
                title: 'Stroke-Play')),
        Expanded(
          child: selectButton(
              onTap: () {
                formatPlayIndex = 1;
                setState(() {});
              },
              isSelected: formatPlayIndex == 1,
              title: 'Math-Play'),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: paddingScreen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              roundSettingTitle,
              const SizedBox(
                height: 16,
              ),
              inGroupButton,
              const SizedBox(
                height: 12,
              ),
              outGroupButton,
              const SizedBox(
                height: 40,
              ),
              roundSettingGroupTitle,
              const SizedBox(
                height: 20,
              ),
              listUser,
              const SizedBox(
                height: 12,
              ),
              Divider(
                color: const Color(0xFFD4D9E1).withOpacity(0.7),
                height: 1,
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(child: addPlayerButton),
              const SizedBox(
                height: 35,
              ),
              Text(
                'Format of play',
                style: primaryTextStyle,
              ),
              const SizedBox(
                height: 16,
              ),
              groupSelectBox,
            ],
          ),
        ),
      ),
    );
  }

  Widget customButton(
      {required String title,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color:
                isSelected ? const Color(0xFF2DBA63) : const Color(0xFFB0EFC8)),
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 32,
        ),
        child: Text(
          title,
          style: TextStyle(
              color: isSelected
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF2DBA63),
              fontWeight: FontWeight.w700,
              fontSize: 14),
        ),
      ),
    );
  }

  Widget selectButton(
      {required String title,
      required bool isSelected,
      required VoidCallback onTap}) {
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
                  : Border.all(width: 1, color: Colors.black),
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
                color: Color(0xFF414955)),
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
