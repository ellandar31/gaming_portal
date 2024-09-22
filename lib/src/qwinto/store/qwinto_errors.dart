
class QwintoErros {

  List<bool> _errors = [false,false,false,false];
  
  QwintoErros();

  void reinit(){
    _errors = [false,false,false,false];
  }

  void setError(int pos, bool value){
    _errors[pos] = value;
  }

  bool getError(int pos){
    return _errors[pos];
  }

  int getScore(){
    return _errors.where((element) => element).length * 5;
  }

  bool isFilled()
  {
    return _errors.where((element) => element).length == 4;
  }

}
