class Flower
{
  String name = '',sname = '';
  String imagePath = '';
  List<String> colors = [];
  String id = '';

  Flower(String name, String sname,List<String> colors,String imagePath)
  {
    this.name = name;
    this.imagePath = imagePath;
    this.colors = colors;
    this.sname = sname;
  }

}