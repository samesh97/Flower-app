import 'package:flora_sense/database/LocalData.dart';
import 'package:flora_sense/models/Flower.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class TileItem extends StatefulWidget
{
  late Flower flower;
  late Function viewMore;
  late Function delete;

  TileItem(this.flower,this.viewMore,this.delete) {}

  @override
  _TileItemState createState() => _TileItemState(flower,viewMore,delete);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

class _TileItemState extends State<TileItem> {

  late Flower flower;
  late Function viewMore;
  Function delete;


  _TileItemState(this.flower,this.viewMore,this.delete) {}



  Widget mainIcon =  Text('');


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {

      mainIcon = GestureDetector(
        child: Container(

            height: 20,
            width: 70,
            // color: Theme.of(context).buttonColor,
            child: Center(
                child: Image.asset('assets/images/arrow.png')
            )

        ),
        onTap: () => {viewMore(flower)},
      );

    });

  }

  @override
  Widget build(BuildContext context)
  {
    Widget w = Container(

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
          GestureDetector(onTap: () => {viewMore(flower)},child: FadeInImage(image: NetworkImage(widget.flower.preview), placeholder: AssetImage('assets/images/icon.png'),width: 130,)),
          SizedBox(width: 20,),

          GestureDetector(
              onTap: () => {viewMore(flower)},
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  widget.flower.name,
                  style: TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                SizedBox(height: 5,),

                Text(
                  widget.flower.scientific_name,
                  style: TextStyle(
                      color: Theme.of(context).disabledColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),
                ),
                SizedBox(height: 8,),
                getColorList(widget.flower.colors),
                SizedBox(height: 15,),


              ],
            ),

          ),


          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

               mainIcon

              ],
            ),
          ),


        ],
      ),
    );

    getDeleteIcon();

    return w;
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
                color: TileItem.fromHex(list[position]),
                shape: BoxShape.circle
            ),
          );
        },
      ),
    );
  }

  getDeleteIcon()
  {
    LocalData.isLogin().then((b) => {

      if(b)
        {
          setDeleteIcon()
        }


    });
  }

  setDeleteIcon()
  {

    setState(() {

      mainIcon =  GestureDetector(
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Image.asset('assets/images/delete.png',width: 28,height: 28,),
        ),
        onLongPress: () => {delete(flower)},
      );

    });


  }

}

