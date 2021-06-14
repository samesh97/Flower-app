import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';

class ImageItem extends StatefulWidget
{

  late File file;
  late VoidCallback callback;
  late Function remove;
  late int position;

  ImageItem(File file,int position,VoidCallback callback,Function remove)
  {
    this.file = file;
    this.callback = callback;
    this.remove = remove;
    this.position = position;
  }

  @override
  _ImageItemState createState() => _ImageItemState(file,position,callback,remove);
}

class _ImageItemState extends State<ImageItem>
{

  late VoidCallback callback;
  late Function remove;
  late File file;
  late int position;

  _ImageItemState(File file,int position,VoidCallback callback,Function remove)
  {
    this.file = file;
    this.callback = callback;
    this.remove = remove;
    this.position = position;
  }


  @override
  Widget build(BuildContext context)
  {
    return Container(

      child: getTile()

    );
  }
  Widget getTile()
  {
      if(file != null && file.path != null && !file.path.isEmpty)
      {

        return Container(
          width: 80,
          height: 40,
          margin: EdgeInsets.only(right: 5,left: 5),
          padding: EdgeInsets.all(5),
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
          child: GestureDetector(
            child: Image.file(file,
              width: 20,
              height: 20,
                fit: BoxFit.cover
            ),
            onLongPress: () => {remove(position)},
          ),
        );





        return Container(
            width: 80,
            height: 40,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(1),
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


            child: GestureDetector(
              child: Image.file(file,
                  fit: BoxFit.cover, width: 20,
                height: 20,),
              onLongPress:() => {remove(position)},
            )
        );
      }
      return Container(
        width: 80,
        height: 40,
        margin: EdgeInsets.only(right: 5),
        padding: EdgeInsets.all(5),
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
        child: GestureDetector(
            child: Image.asset('assets/images/image_icon.png',
              width: 20,
              height: 20,
            ),
          onTap: () => {callback.call()},
        ),
      );
  }
}
