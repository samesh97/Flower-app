import 'package:flora_sense/database/LocalData.dart';
import 'package:flora_sense/models/Flower.dart';
import 'package:flora_sense/pages/updateFlower.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import '../pages/colorListItem.dart';
import 'ListTile.dart';

class ViewMore extends StatefulWidget
{
  late Flower flower;

  ViewMore({Key? key,required this.flower}) : super(key: key);

  @override
  _ViewMoreState createState() => _ViewMoreState(flower);
}

class _ViewMoreState extends State<ViewMore>
{

  late Flower flower;
  List<String> imageList = [];
  Widget updateFlowerButton = Text('');

  _ViewMoreState(@required this.flower);


  @override
  void initState() {
    // TODO: implement initState

    imageList = flower.images;


    super.initState();
  }


  @override
  Widget build(BuildContext context)
  {
    Widget w = Scaffold(

      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                )),
            child: Container(

            padding:EdgeInsets.all(30.0),
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
                children: [

                  // Expanded(child: Center(child: Text(
                  //   flower.name,
                  //   style: TextStyle(
                  //       color: Theme.of(context).highlightColor,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 20
                  //   ),
                  // ),
                  // )),

                  SizedBox(height: 30,),

                  Container(
                    height: 290,
                    child: Carousel(
                      autoScroll: true,
                      // widgets
                      items:
                      [
                          for(String link in imageList) getCarouselImageView(link)
                      ],
                    ),
                  ),


                  // FadeInImage(image: NetworkImage(flower.preview), placeholder: AssetImage('assets/images/icon.png'),width: 200,),

                  SizedBox(height: 30,),
                  Container(

                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                                flower.name,
                                style: TextStyle(
                                    color: Theme.of(context).buttonColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30
                                )
                            ),
                            SizedBox(height: 3,),
                            Text(
                                flower.scientific_name,
                                style: TextStyle(
                                    color: Theme.of(context).buttonColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15
                                )
                            ),

                          ],

                        ),

                        getColorList(flower.colors),
                      ],
                    )

                  ),
                  SizedBox(height: 35,),



                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                        'Family -> ${flower.family}',
                        style: TextStyle(
                            color: Theme.of(context).focusColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                        ),textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 6,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                        'Genus -> ${flower.genus}',
                        style: TextStyle(
                            color: Theme.of(context).focusColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        )
                      ,textAlign: TextAlign.start,
                    ),
                  ),

                  SizedBox(height: 40,),


                  // Expanded(child: Center(child: Text(flower.name,style: TextStyle(
                  //     color: Theme.of(context).highlightColor,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 20
                  // ),),)),
                  //
                  // Expanded(child: Center(child: Text(flower.scientific_name,style: TextStyle(
                  //     color: Theme.of(context).highlightColor,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 20
                  // ),),)),


                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text('- Background -',style: TextStyle(
                          color: Theme.of(context).highlightColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 19
                      )),
                    ),
                  ),


                  SizedBox(height: 40,),

                  Container(child: Center(child: Text(flower.short_desc,style: TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ),),)),

                  SizedBox(height: 40,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text('- Usage -',style: TextStyle(
                          color: Theme.of(context).highlightColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 19
                      )),
                    ),
                  ),

                  SizedBox(height: 35,),
                  Container(width: MediaQuery.of(context).size.width,child: Text(flower.usage,style: TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ),)),


                  SizedBox(height: 35,),

                  updateFlowerButton,



                ],
              )
            ),
          ),
        ),
      ),

    );

    checkLogin();
    return w;
  }
  checkLogin()
  {
    LocalData.isLogin().then((value) => {

      if(value) getUpdateFlowerButton()

    });
  }
  getUpdateFlowerButton()
  {
    setState(() {

      updateFlowerButton = GestureDetector(

        child: Container(
          width: 120,
          height: 40,
          margin: EdgeInsets.only(right: 20),

          decoration: BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: BorderRadius.all(Radius.circular(7))
          ),
          child: Center(child: Text('Update Flower',style: TextStyle(color: Theme.of(context).accentColor,fontSize: 14,fontWeight: FontWeight.bold),)),
        ),
        onTap: () => {updateFlower()},
      );
    });
  }

  updateFlower()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateFlower(flower: flower,)));
  }
  Widget getCarouselImageView(String image)
  {
    return FadeInImage(image: NetworkImage(image),fit: BoxFit.cover, placeholder: AssetImage('assets/images/icon.png',),width: 200, height: 200,);
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
            margin: EdgeInsets.only(right: 6),
            width: 15,
            height: 15,
            decoration: new BoxDecoration(
                color: TileItem.fromHex(list[position]),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.black87, spreadRadius: 0.8)
                ]
            ),
          );
        },
      ),
    );
  }
  addColor(result){}
  removeColor(pos){}
}
