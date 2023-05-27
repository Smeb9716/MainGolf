import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget{
  const AccountScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();

  int indexSex = 0;
  @override
  Widget build(BuildContext context) {
    _controllerFirstName.text = 'Anh';
    _controllerLastName.text = 'Nguyen Van';

    final buttonUpdate = Container(
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
                  child: Text('Update', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'SVN-Gilroy'))
              ),
            ),
          ),
        ),
      ),
    );
    final avatarCircle = Stack(
      children: [
        const CircleAvatar(
          radius: 75,
          backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
          backgroundColor: Colors.transparent,
        ),
        GestureDetector(
          onTap: (){},
          child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 85),
              child: Image.asset('assets/images/ic_camera.png', height: 70, width: 70)),
        )
      ],
    );
    const nameUser = Text('Nguyen Van Anh', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'SVN-Gilroy'));
    const textEditProfile = Text('Edit Profile', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff9796A1)));
    final phoneNumber = Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffEEEEEE),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: const Color(0xffD4D9E1), width: 1)
      ),
      child: const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('0981539453', style: TextStyle(fontSize: 16, color: Color(0xff414B5B), fontFamily: 'SVN-Gilroy', fontWeight: FontWeight.w500))
          )
      ),
    );
    final groupSelectSex = Row(
      children: [
        Expanded(
            flex: 1,
            child: selectButton(
                onTap: () {
                  indexSex = 0;
                  setState(() {});
                },
                isSelected: indexSex == 0,
                title: 'Male')),
        Expanded(
            flex: 3,
            child: selectButton(
                onTap: () {
                  indexSex = 1;
                  setState(() {});
                },
                isSelected: indexSex == 1,
                title: 'Female'))
      ]
    );

     return Scaffold(
       resizeToAvoidBottomInset: false,
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children:  [
           Expanded(
               flex: 9,
               child: SingleChildScrollView(
                 physics: const NeverScrollableScrollPhysics(),
                 child: Padding(
                   padding: const EdgeInsets.only(left: 24, right: 24, top: 70),
                   child: Center(
                     child: Column(
                       children:  [
                         avatarCircle,
                         nameUser,
                         const SizedBox(height: 9),
                         textEditProfile,
                         const SizedBox(height: 32),
                         phoneNumber,
                         const SizedBox(height: 16),
                         baseEditProfile(textEditingController: _controllerFirstName),
                         const SizedBox(height: 16),
                         baseEditProfile(textEditingController: _controllerLastName),
                         const SizedBox(height: 16),
                         groupSelectSex
                       ],
                     ),
                   ),
                 ),
               )
           ),
           Expanded(
               flex: 1,
               child: buttonUpdate
           )
         ],
       )
     );
  }
}

Widget baseEditProfile({required TextEditingController textEditingController}){
  return TextField(
    controller: textEditingController,
    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'SVN-Gilroy', color: Color(0xff414B5B)),
    autofocus: false,
    onChanged: (searchText) {
      searchText = searchText.toLowerCase();
    },
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(color: Color(0xffD4D9E1)),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff2DBA63)),
            borderRadius: BorderRadius.circular(25.0)
        )
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
            border: isSelected ? Border.all(width: 6, color: const Color(0xFF2DBA63),) : Border.all(width: 1, color: const Color(0xffD9D9D9))
          ),
        ),
        const SizedBox(width: 8),
        Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFF414955), fontFamily: 'SVN-Gilroy'))
      ],
    ),
  );
}



