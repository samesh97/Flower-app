import 'package:flora_sense/models/ImageUpdate.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';

class ImageItemUpdate extends StatefulWidget
{

  late ImageUpdate file;
  late VoidCallback callback;
  late Function remove;
  late int position;

  ImageItemUpdate(ImageUpdate file,int position,VoidCallback callback,Function remove)
  {
    this.file = file;
    this.callback = callback;
    this.remove = remove;
    this.position = position;
  }

  @override
  _ImageItemUpdateState createState() => _ImageItemUpdateState(file,position,callback,remove);
}

class _ImageItemUpdateState extends State<ImageItemUpdate>
{

  late VoidCallback callback;
  late Function remove;
  late ImageUpdate file;
  late int position;

  _ImageItemUpdateState(ImageUpdate file,int position,VoidCallback callback,Function remove)
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
      if(file.file.path.isNotEmpty)
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
            child: Image.file(file.file,
              width: 20,
              height: 20,
                fit: BoxFit.cover
            ),
            onLongPress: () => {remove(position)},
          ),
        );





      }
      else if(file.link.isNotEmpty)
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
            child: Image.network(file.link,
                width: 20,
                height: 20,
                fit: BoxFit.cover
            ),
            onLongPress: () => {remove(position)},
          ),
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
