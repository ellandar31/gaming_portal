import 'package:flutter/material.dart';

enum QwintoColor { 
  red (Colors.red), 
  yellow (Colors.yellow), 
  purple (Colors.purple) ;
  
  final Color value;

  const QwintoColor(this.value);

  String get name {
    return toString().split('.').last;
  }

  Color getValue(){
    return value;
  }
}

enum QwintoForm { 
  empty , 
  circle , 
  square ,
  pentagone ;
}

enum PentagonesCol{
  first(2, QwintoColor.purple),
  second(3,QwintoColor.red),
  third(7,QwintoColor.red),
  fourth(8,QwintoColor.yellow),
  fifth(9,QwintoColor.purple);

  final int column;
  final QwintoColor color;
  
  const PentagonesCol(this.column, this.color);

  QwintoColor getColor(){return color;}
  int getColumn(){return column;}
}