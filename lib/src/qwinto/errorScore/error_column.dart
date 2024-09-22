import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';
import 'package:provider/provider.dart';

class ErrorCheckWidget extends StatelessWidget {
  const ErrorCheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
     var qwintoState = Provider.of<QwintoState>(context);
    List<int?> errors = qwintoState.errorList;

    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Erreur(s)',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          const SizedBox(height: 5),
          Column(
            crossAxisAlignment : CrossAxisAlignment.center,
            children: getCheckboxList(errors,context,qwintoState)
          ),
        ],
      ),
    );    
  }
  
  List<Widget> getCheckboxList(List<int?> errors,BuildContext context, QwintoState qwintoState){
    return  List.generate(
      errors.length,
      (index) {
        // Création des Text pour chaque valeur dans la liste
        return Checkbox(value: errors[index]! > 0, 
              checkColor: Colors.black,
              fillColor: WidgetStateProperty.resolveWith(getColor),
              onChanged: (bool? value){qwintoState.addToError(value!,index);});
      }
    );
  }

  
    Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.white;
    }

}