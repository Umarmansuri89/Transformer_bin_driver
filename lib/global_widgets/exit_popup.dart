



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackPressed extends StatefulWidget {
  const BackPressed({Key? key}) : super(key: key);

  @override
  State<BackPressed> createState() => _BackPressedState();
}

class _BackPressedState extends State<BackPressed> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      backgroundColor: Colors.orange,
      title:
      Padding(padding: EdgeInsets.only(top: 20),child:  Center(
        child:
        Text(
          'Do You Want To Exit',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Lato',
          ),
        ),

        //Text('Do you want to exit ',),
      ),),


      content:
      Text(''),
      actionsAlignment: MainAxisAlignment.spaceEvenly,

      actions: <Widget>[
        Padding(padding: EdgeInsets.only(bottom: 20),child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextButton(
            child: Text(
              'NO',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'Lato',
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ),),
        Padding(padding: EdgeInsets.only(bottom: 20),child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextButton(
            child: Text(
              'YES',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'Lato',
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
              SystemNavigator.pop();
            },
          ),
        ),),


      ],
    );
  }
   onBackPressed(context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            backgroundColor: Colors.orange,
            title:
            Padding(padding: EdgeInsets.only(top: 20),child:  Center(
              child:
              Text(
                'Do You Want To Exit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lato',
                ),
              ),

              //Text('Do you want to exit ',),
            ),),


            content:
            Text(''),
            actionsAlignment: MainAxisAlignment.spaceEvenly,

            actions: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 20),child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  child: Text(
                    'NO',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Lato',
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ),),
              Padding(padding: EdgeInsets.only(bottom: 20),child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  child: Text(
                    'YES',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Lato',
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    SystemNavigator.pop();
                  },
                ),
              ),),


            ],
          );
        });
  }
}
