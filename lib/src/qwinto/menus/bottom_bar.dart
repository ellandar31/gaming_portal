
import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';
import 'package:provider/provider.dart';

class QwintoBottomAppBar extends StatefulWidget {
  const QwintoBottomAppBar({super.key});

  @override
  _QwintoBottomAppBarState createState() => _QwintoBottomAppBarState();
}

class _QwintoBottomAppBarState extends State<QwintoBottomAppBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      child: 
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter number',
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                // Récupère la valeur du champ de texte
                int? value = int.tryParse(_controller.text);
        
                // Si la valeur est valide, met à jour le QwintoState
                if (value != null) {
                  Provider.of<QwintoState>(context, listen: false).updateValue(value);
                  _controller.clear(); // Efface le champ de texte après soumission
                }
              },
            ),
          ],
        ),
      
    );
  }
}