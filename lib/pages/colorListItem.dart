import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colorPicker.dart';

class ColorItem extends StatefulWidget
{
  late String color;
  Function colorAdd;

  ColorItem(this.color,this.colorAdd);

  @override
  _ColorItemState createState() => _ColorItemState(color,colorAdd);
}

class _ColorItemState extends State<ColorItem>
{
  late String color;
  Function colorAdd;


  _ColorItemState(this.color,this.colorAdd);

  @override
  Widget build(BuildContext context)
  {
    return getTile();
  }
  Widget getTile()
  {
      if(color.isEmpty)
      {
        return GestureDetector(child: Image.asset('assets/images/add.png',width: 40,height: 40,),onTap: () => {openColorPicker(context)},);
      }

      return Container(
        margin: EdgeInsets.only(left: 15),
        width: 40,
        height: 40,
        decoration: new BoxDecoration(
            color: fromHex(color),
            shape: BoxShape.circle
        ),
      );
  }
  openColorPicker(BuildContext context) async
  {
    var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => ColorPickerF()));
    colorAdd(result);
  }
  static Color fromHex(String hexString)
  {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

}
