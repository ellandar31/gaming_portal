import 'package:flutter/material.dart';
import 'package:flutter_dice/dice_controller.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var qwintoState = Provider.of<QwintoState>(context);
    List<Color> diceColors = [Colors.red,Colors.yellow,Colors.purple,];
    
    final diceController = Get.find<DiceController>();
    
    return ElevatedButton(
      child: const Icon(Icons.refresh),
      onPressed: () {
        qwintoState.reinit();
        diceController.initDices(diceColors);
      },
    );
  }
}
