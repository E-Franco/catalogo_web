extension StringExt on String{
  String capitalize(){
    if(length > 1){
      return this[0].toUpperCase() + substring(1).toLowerCase();
    } else{
      return toUpperCase();
    }
  }

  String upperCaseWords(){
    if(length <= 1){
      return toUpperCase();
    } else{
      return split(' ').map((e) => e.capitalize()).join(' ');
    }
  }
}