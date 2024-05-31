import 'package:flutter/material.dart';

class MoreHistoryView extends StatefulWidget {
  const MoreHistoryView({Key? key}) : super(key: key);

  @override
  _MoreHistoryViewState createState() => _MoreHistoryViewState();
}

class _MoreHistoryViewState extends State<MoreHistoryView> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
          Expanded(
            child: ElevatedButton(
              onPressed:(){
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text("back")
            )
          ) 
      )
    );
  }
}