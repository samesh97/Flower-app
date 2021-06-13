class Flower
{
  String name = '',scientific_name = '';
  String preview = '';
  List<String> colors = [];
  String id = '';


  Flower(String name, String scientific_name,List<String> colors,String preview)
  {
    this.name = name;
    this.preview = preview;
    this.colors = colors;
    this.scientific_name = scientific_name;
  }


}