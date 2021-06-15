import 'package:shared_preferences/shared_preferences.dart';

class LocalData
{
    static final String Key = "isLogin";

    static Future<bool> isLogin() async
    {
        SharedPreferences sp = await SharedPreferences.getInstance();
        String? b =  sp.getString(Key);
        if(b != null)
        {
           return (b == 'true');
        }
        return false;

    }
    static setLogin() async
    {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(Key, 'true');
    }
    static Logout() async
    {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(Key, 'false');
    }
}