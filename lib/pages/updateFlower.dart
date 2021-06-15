import 'package:flora_sense/models/Flower.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateFlower extends StatefulWidget
{
  late Flower flower;

  UpdateFlower({Key? key,required this.flower}) : super(key: key);

  @override
  _UpdateFlowerState createState() => _UpdateFlowerState(flower);
}

class _UpdateFlowerState extends State<UpdateFlower>
{

  late Flower flower;
  _UpdateFlowerState(this.flower);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      body: Center(
        child: Text('Selected Flower ID ${flower.id}'),
      ),

    );
  }
}
