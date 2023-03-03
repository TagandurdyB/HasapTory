import 'package:flutter/material.dart';



class FirstScreen extends StatelessWidget {
   const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mySize=MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
     // color:Colors.red,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      /*    GestureDetector(
              onTap: () {
                ProcessAppBar(context).bottomDrawer(true);
              },
              child: const Icon(Icons.home)),*/
              Text("${mySize.width}"),Text("${mySize.height}")
        ],
      ),
    );
  }
}
