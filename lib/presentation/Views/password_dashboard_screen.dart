import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_saver/cubit/show_password_cubit/show_password_cubit.dart';
import 'package:password_saver/data/models/password_model.dart';
import 'package:password_saver/presentation/Views/add_password_screen.dart';
import 'package:password_saver/presentation/widgets/custom_counter_card.dart';
import 'package:password_saver/presentation/widgets/custom_password_card.dart';
import 'package:password_saver/presentation/widgets/custom_text_feild.dart';

class PasswordDashBoard extends StatefulWidget {
  const PasswordDashBoard({super.key});
  static String id = 'PasswordDashboard';

  @override
  State<PasswordDashBoard> createState() => _PasswordDashBoardState();
}

class _PasswordDashBoardState extends State<PasswordDashBoard> {
  late List<PasswordModel> notesList;
  late List<PasswordModel> filteredList;
  final formControler=TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ShowPasswordCubit>(context).showpassword();
  }

  @override
  Widget build(BuildContext context) {
    int activeIndex = 1;
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
      body: BlocBuilder<ShowPasswordCubit, ShowPasswordState>(
        builder: (context, state) {
          notesList = BlocProvider.of<ShowPasswordCubit>(context).notes;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomCounterCard(
                        topText: '${notesList.length}',
                        underText: 'Password Stroed',
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const CustomCounterCard(
                        topText: '0',
                        underText: 'password Compromised',
                      ),
                    ],
                  ),
                  CustomTextFeild(
                    controller:formControler ,
                    onChange: (val) {
                      passTosearch(val);
                    },
                    hintText: 'Search For Password..',
                    topPadding: 10,
                    prefixIcon: const Icon(Icons.search),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: formControler.text.isEmpty? notesList.length:filteredList.length,
                    itemBuilder: (context, index) {
                      return CustomPasswordCard(
                        password:formControler.text.isEmpty? notesList[index]:filteredList[index],
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void passTosearch(value) {
    filteredList = notesList
        .where((password) => password.title.toLowerCase().contains(value))
        .toList();
    setState(() {});
  }
}
