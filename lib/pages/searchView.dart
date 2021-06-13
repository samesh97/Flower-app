import 'package:flora_sense/models/Flower.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ListTile.dart';
import '../database/dataHandler.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
{

  List<Flower> flowerList = [];




  @override
  void initState(){

    super.initState();
    DBHandler().getData(context).then((List<Flower> list) => {

      setData(list)

    });
  }
  setData(List<Flower> list)
  {
    setState(() {
      flowerList = list;
    });
  }

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),

            child: Column(
              children: [
                SizedBox(height: 30,),

                Container(

                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(const Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ]
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 3),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextField(

                          decoration: InputDecoration(
                              border: InputBorder.none,

                              hintText: 'Search flowers',
                              hintStyle: TextStyle(fontWeight: FontWeight.w500)
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                          child: Container(
                              width: 25,
                              height: 25,
                              child: Image.asset('assets/images/search_icon.png')

                          )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30,),

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: flowerList.length,
                  itemBuilder: (context,position) {

                    String name = flowerList[position].name;
                    String sname = flowerList[position].sname;
                    String image = flowerList[position].imagePath;
                    List<String> colors = flowerList[position].colors;

                    return TileItem(name,sname,colors,image);
                  },
                ),
              ],
            )
          ),
        ),
        
    );
  }
}
