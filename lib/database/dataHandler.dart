import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flora_sense/models/Flower.dart';
import 'package:flutter/cupertino.dart';


class DBHandler
{
   Future<List<Flower>> getData(BuildContext context) async
   {

     // Firebase.initializeApp();
     List<Flower> flowers = [];

     await FirebaseFirestore.instance
         .collection('flowers')
         .get()
         .then((QuerySnapshot querySnapshot)
         {
             querySnapshot.docs.forEach((doc)
             {
               String name = doc["name"];
               String imagePath = doc["imagePath"];
               String sname = doc["sname"];
               List<dynamic> colors = doc["colors"];
               List<String> list = colors.map((s) => s as String).toList();

               Flower flower = new Flower(name, sname, list, imagePath);
               flowers.add(flower);



             });
         });

     return flowers;

   }
}