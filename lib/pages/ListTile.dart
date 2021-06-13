import 'package:flora_sense/models/Flower.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class TileItem extends StatelessWidget
{
  Flower flower = new Flower('','',[],'');

  TileItem(String name, String scientific_name,List<String> colors,String preview)
  {
    flower.name = name;
    flower.preview = preview;
    flower.colors = colors;
    flower.scientific_name = scientific_name;
  }

  @override
  Widget build(BuildContext context)
  {
    return Container(

      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(5),
      height: 140,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(const Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ]
      ),

      child: Row(

        children: [
          FadeInImage(image: NetworkImage(flower.preview), placeholder: AssetImage('assets/images/icon.png'),width: 130,),
          SizedBox(width: 20,),
          Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                flower.name,
                style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
              SizedBox(height: 5,),

              Text(
                flower.scientific_name,
                style: TextStyle(
                    color: Theme.of(context).disabledColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                ),
              ),
              SizedBox(height: 8,),
              getColorList(flower.colors),
              SizedBox(height: 15,),


            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Container(

                    height: 20,
                    width: 70,
                    // color: Theme.of(context).buttonColor,
                    child: Center(
                        child: Image.asset('assets/images/arrow.png')
                    )

                ),

              ],
            ),
          ),


        ],
      ),
    );
  }
  Widget getColorList(List<String> list)
  {
    return Container(
      height: 20,
      child: ListView.builder(
        shrinkWrap: true,

        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context,position){
          return Container(
            margin: EdgeInsets.only(right: 5),
            width: 12,
            height: 12,
            decoration: new BoxDecoration(
                color: fromHex(list[position]),
                shape: BoxShape.circle
            ),
          );
        },
      ),
    );
  }
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }


}

