
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_saver/cubit/add_password_cubit/add_password_cubit.dart';
import 'package:password_saver/cubit/show_password_cubit/show_password_cubit.dart';
import 'package:password_saver/data/models/password_model.dart';
import 'package:password_saver/presentation/Views/edit_password_screen.dart';
import 'package:password_saver/presentation/widgets/custom_text.dart';

class CustomPasswordCard extends StatefulWidget {
  const CustomPasswordCard({
    super.key,
    required this.password,
  });
  final PasswordModel password;

  @override
  State<CustomPasswordCard> createState() => _CustomPasswordCardState();
}

class _CustomPasswordCardState extends State<CustomPasswordCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPasswordCubit, AddPasswordState>(
      builder: (context, state) {
        return GestureDetector(
          onLongPress: () async {
            return showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Delete Password'),
                  content: const SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('Are you sure you want to delete this password ?'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Yes'),
                      onPressed: () {
                        widget.password.delete();
                        BlocProvider.of<ShowPasswordCubit>(context)
                            .showpassword();
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditPasswordScreen(
                  passsword: widget.password,
                ),
              ),
            );
          },
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), border: Border.all()),
            margin: const EdgeInsetsDirectional.only(top: 20),
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.memory(widget.password.image!.imageData,fit: BoxFit.cover,),
                  //// Image.asset('assets/images/facebook.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                    width: 100,
                    child: CustomText(
                      text: widget.password.title,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.teal,
                  ),
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: widget.password.password));
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

}
