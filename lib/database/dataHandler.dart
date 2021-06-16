import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flora_sense/models/Flower.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:math';



class DBHandler
{
  final String COLLECTION_NAME = "flowers";

   Future<List<Flower>> getData(BuildContext context) async
   {


     // Firebase.initializeApp();
     List<Flower> flowers = [];

     await FirebaseFirestore.instance
         .collection(COLLECTION_NAME)
         .orderBy('name')
         .get()
         .then((QuerySnapshot querySnapshot)
         {
             querySnapshot.docs.forEach((doc)
             {
               String name = doc["name"];
               String preview = doc["preview"];
               String sname = doc["scientific_name"];
               List<dynamic> colors = doc["colors"];
               List<String> colorList = colors.map((s) => s as String).toList();

               String family = doc["family"];
               String genus = doc["genus"];
               String short_desc = doc["short_desc"];
               String usage = doc["usage"];

               List<dynamic> imageListD = doc["images"];
               List<String> imageList = imageListD.map((s) => s as String).toList();


               String id = doc.id;

               Flower flower = new Flower(id,name, sname, colorList, preview,family,genus,short_desc,usage,imageList);
               flowers.add(flower);





             });
         });

     return flowers;

   }
   Future<String> uploadImage(File file) async
   {

     var rng = new Random();
     var id = rng.nextInt(10000000);

     var downloadUrl;

     try
     {
       var snapshot = await FirebaseStorage.instance
           .ref()
           .child('uploads/${id}.png')
           .putFile(file);
       downloadUrl = await snapshot.ref.getDownloadURL();

     }
     on FirebaseException catch (e) {}


     return downloadUrl;
   }
   Future<bool> insertDocument(File preview,List<File> images,List<String> colors,String name,String sname,String family,String genus,String short_desc,String usage) async
   {

     String previewImageLink = await uploadImage(preview);

     List<String> uploadedImageLinks = [];


     for(File f in images)
     {
       if(f.path.isNotEmpty)
       {
         String link = await uploadImage(f);
         uploadedImageLinks.add(link);
       }

     }


      List<dynamic> dcolors  = [];
      for(String c in colors)
      {
        if(c.isNotEmpty)
          dcolors.add(c);
      }

      Map<String, dynamic> flower = <String, dynamic>{
        'name': name,
        'scientific_name': sname,
        'preview' : previewImageLink,
        'colors' : dcolors,
        'family' : family,
        'genus' : genus,
        'short_desc' : short_desc,
        'usage' : usage,
        'images' : uploadedImageLinks

      };


     try
     {
       await FirebaseFirestore.instance
           .collection(COLLECTION_NAME).add(flower);

       return true;
     }
     on Exception catch (e)
     {
        return false;
     }

   }
   Future<bool> deleteFlower(Flower flower) async
   {
     try
     {
       await FirebaseFirestore.instance
           .collection(COLLECTION_NAME)
           .doc(flower.id).delete();
       return true;
     }
     catch(e)
     {
        return false;
     }


   }

}