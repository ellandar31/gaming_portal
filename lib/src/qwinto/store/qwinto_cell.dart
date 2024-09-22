import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_enums.dart';

class QwintoCell {

  int _value;
  final QwintoForm _form;
  final Color _color;

  QwintoCell({required int value, required QwintoForm form, required Color color})
      : _value = value, _form = form, _color= color;

  int getValue(){return _value;}
  void setValue(int value){ _value = value;}

  QwintoForm getForm(){return _form;}
  
  Color getColor(){return _color;}

}
