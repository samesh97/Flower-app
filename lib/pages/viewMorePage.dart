import 'package:flora_sense/models/Flower.dart';
import 'package:flora_sense/pages/updateFlower.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  _ViewMoreState(@required this.flower);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      body: Center(
        child: Container(
        padding:EdgeInsets.all(30.0),
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
            children: [

              Expanded(child: Center(child: Text(
                flower.name,
                style: TextStyle(
                    color: Theme.of(context).highlightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
              )),

              FadeInImage(image: NetworkImage(flower.preview), placeholder: AssetImage('assets/images/icon.png'),width: 200,),
              Expanded(child: Center(child: Text(flower.scientific_name,style: TextStyle(
                  color: Theme.of(context).highlightColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),)),
              Expanded(child: Center(child: Text('Usage - \n ${flower.usage}',style: TextStyle(
                  color: Theme.of(context).highlightColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),)),
              Expanded(child: Center(child: Text('Selected Flower ID ${flower.short_desc}',style: TextStyle(
                  color: Theme.of(context).highlightColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
              ),),)),
              GestureDetector(

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
              ),

            ],
          )
        ),
      ),

    );
  }
  updateFlower()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateFlower(flower: flower,)));
  }
}
