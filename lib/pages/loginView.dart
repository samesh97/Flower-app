import 'package:flora_sense/database/LocalData.dart';
import 'package:flora_sense/pages/searchView.dart';
import 'package:flora_sense/pages/splashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Login extends StatefulWidget
{
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();

}

class _LoginState extends State<Login>
{

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Widget widgetToBeDisplayed = Text('');


  @override
  Widget build(BuildContext context)
  {
    Widget w = Scaffold(

      body: Container(

        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(left: 30,right: 30),
        child: Column(

          children: [


            Expanded(
              child: Container(
                child:  Image.asset('assets/images/icon.png',),
              ),
            ),


            Expanded(
              child: Column(

                children: [

                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(

                      controller: usernameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),

                          hintText: 'Username',
                          hintStyle: TextStyle(fontWeight: FontWeight.w500)
                      ),
                    ),
                  ),

                  SizedBox(height: 15,),

                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(

                      controller: passwordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),

                          hintText: 'Password',
                          hintStyle: TextStyle(fontWeight: FontWeight.w500)
                      ),
                    ),
                  ),

                  SizedBox(height: 35,),
                  GestureDetector(
                    onTap: () => {login()},
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(

                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.all(const Radius.circular(10.0)),

                      ),
                      child: Center(child: Text('Login',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Theme.of(context).accentColor),)),


                    ),
                  ),

                  SizedBox(height: 15,),

                  widgetToBeDisplayed,



                ],
              )
            ),



          ],


        ),

      ),

    );
    getViewBasedOnLoginState();
    return w;
  }
  getViewBasedOnLoginState() async
  {
    LocalData.isLogin().then((b) => {

      if(b)
      {
          setView(GestureDetector(onTap:() => {logout()},child: Text('Log out?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)))
      }
      else
      {
        setView(GestureDetector(onTap:() => {skipLogin()},child: Text('Skip login and continue',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)))
      }

    });

  }
  setView(Widget w)
  {
    setState(() {
      widgetToBeDisplayed = w;

    });
  }
  skipLogin()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
  }
  logout()
  {
      LocalData.Logout();
      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  login()
  {
      String username = usernameController.text;
      String password = passwordController.text;

      if(username.isEmpty || password.isEmpty)
      {
          showToast('Enter the required fields first',context:context);
          return;
      }
      else if(username == 'Admin' && password == 'Admin')
      {
        showToast('Login success',context:context);
        LocalData.setLogin();
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
      }
      else
      {
        showToast('Login failed',context:context);
      }
  }
}

