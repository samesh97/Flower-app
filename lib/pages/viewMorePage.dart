import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewMore extends StatefulWidget
{
  late String flowerId;

  ViewMore({Key? key,required this.flowerId}) : super(key: key);

  @override
  _ViewMoreState createState() => _ViewMoreState(flowerId);
}

class _ViewMoreState extends State<ViewMore>
{

  late String flowerId;

  _ViewMoreState(@required this.flowerId);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      body: Center(
        child: Text('Selected Flower ID $flowerId'),
      ),

    );
  }
}
