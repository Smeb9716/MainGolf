import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget{
  AccountScreen({super.key});
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _controllerFirstName.text = 'Anh';
    _controllerLastName.text = 'Nguyen Van';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 9,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 70),
                  child: Center(
                    child: Column(
                      children:  [
                        Stack(
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
                        ),
                        const Text('Nguyen Van Anh', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'SVN-Gilroy')),
                        const SizedBox(height: 9),
                        const Text('Edit Profile', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'SVN-Gilroy', color: Color(0xff9796A1 ))),
                        const SizedBox(height: 32),
                        Container(
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
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _controllerFirstName,
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
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _controllerLastName,
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
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              )
          ),
          const CustomButtonUpdate(),
        ],
      ),
    );
  }
}

class CustomButtonUpdate extends StatelessWidget{
  const CustomButtonUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
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
        )
    );
  }
}
