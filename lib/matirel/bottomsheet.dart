import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheet extends StatefulWidget {
  const BottomSheet({super.key});

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:ElevatedButton(

          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context){
                return SizedBox(
                  height: 600,
                 //child that content the quiz
                );
                }
            );

          },
          child: Text('Let\'s go ',style: TextStyle(
              color: Colors.red
          ),),
          style:ElevatedButton.styleFrom(
            // backgroundColor: Colors.transparent, // Set the button background to transparent
            // shadowColor: Colors.transparent,
          )
      ),
    );
  }
}
