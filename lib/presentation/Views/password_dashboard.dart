import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:password_saver/presentation/Views/add_password_screen.dart';
import 'package:password_saver/presentation/widgets/custom_text_feild.dart';
import 'package:password_saver/widgets/custom_counter_card.dart';
import 'package:password_saver/widgets/custom_password_card.dart';
class PasswordDashBoard extends StatefulWidget {
  const PasswordDashBoard({super.key});
  static String id = 'PasswordDashboardPage';

  @override
  State<PasswordDashBoard> createState() => _PasswordDashBoardState();
}

class _PasswordDashBoardState extends State<PasswordDashBoard> {
  int activeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white, size: 30),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.pushNamed(context, AddPasswordScreen.id);
            },
          ),
          const Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          ),
        ],
        inactiveIcons: const [
          Text("Home"),
          Text("Add"),
          Text("Profile"),
        ],
        color: Colors.white,
        circleColor: Colors.white,
        height: 60,
        circleWidth: 60,
        activeIndex: activeIndex,
        onTap: (value) {
          setState(() {
            activeIndex = value;
          });
        },
        // tabCurve: ,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.white,
        circleShadowColor: Colors.white,
        elevation: 10,
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue, Colors.grey],
        ),
        circleGradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue, Colors.grey],
        ),
      ),

      //AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30.0),
        child: AppBar(
          scrolledUnderElevation:
              0, //to control app bar elevation when you scroll list down him
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: Image.asset(
            'assets/images/social-engineering.png',
            cacheHeight: 50,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  CustomCounterCard(
                    topText: '5',
                    underText: 'Password Stroed',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CustomCounterCard(
                    topText: '0',
                    underText: 'password Compromised',
                  ),
                ],
              ),
              const CustomTextFeild(hintText: 'Search For Password..',topPadding: 10,prefixIcon:  Icon(Icons.search),),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CustomPasswordCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
