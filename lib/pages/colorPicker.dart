import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerF extends StatefulWidget {
  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPickerF> {

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  @override
  Widget build(BuildContext context)
  {
    return getTile();
  }
  Widget getTile()
  {

      return Scaffold(

        body:  Column(

          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            SizedBox(height: 40,),


            GestureDetector(
              child: Container(
                width: 80,
                height: 40,
                margin: EdgeInsets.only(right: 20),

                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(7))
                ),
                child: Center(child: Text('Select',style: TextStyle(color: Theme.of(context).accentColor,fontSize: 14,fontWeight: FontWeight.bold),)),
              ),
              onTap: () => {setResult()},
            ),


            Expanded(

                child: Center(
                  child:AlertDialog(
                      title: const Text('Pick a color!'),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          pickerColor: pickerColor,
                          onColorChanged: changeColor,
                          showLabel: true,
                          pickerAreaHeightPercent: 0.8,
                        ),
                      )),
                ),
            ),



          ],

        )

      );

  }
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }
  setResult()
  {

    String yourHexColor = pickerColor.toString();
    String color = yourHexColor.replaceAll('0xff', '#');
    String re = color.split('#')[1];
    // print('color picked'+color);

    String re2 = re.split(')')[0];

    String finalHexColor = '#' + re2;
    Navigator.pop(context,finalHexColor);
  }
}
