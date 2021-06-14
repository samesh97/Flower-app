import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'searchView.dart';


void main()
{
  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  runApp(
      MaterialApp(
          home : MyApp(),
          theme: ThemeData(
            //page background
            primaryColor: fromHex('#F1F1F1'),
            //low priority texts
            disabledColor: fromHex('#cbced4'),
            //main button background color
            buttonColor: fromHex('#22a652'),
            //card color
            accentColor: fromHex('#FFFFFF'),
            //header color
            highlightColor: fromHex('#081b34')

          ),
        debugShowCheckedModeBanner: false,
      )


  );

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{


  @override
  void initState() {

    super.initState();


    Firebase.initializeApp();


    // WidgetsBinding.instance!
    //     .addPostFrameCallback((_) => navigateToDashBoard(context));



  }
  Future navigateToDashBoard(BuildContext context) async
  {
    Future.delayed(const Duration(seconds: 2),(){

      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
      ));

    });

  }




  @override
  Widget build(BuildContext context) {
    Widget w = Scaffold(

      body: Container(
        color: Theme.of(context).buttonColor,
        child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/icon.png'),
                Text(
                  'Flower Sense',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Theme.of(context).accentColor
                  ),

                ),
              ],
            ),

        ),
      ),

    );
    navigateToDashBoard(context);
    return w;
  }

}



