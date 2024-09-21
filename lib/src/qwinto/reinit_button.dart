import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';
import 'package:provider/provider.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var qwintoState = Provider.of<QwintoState>(context);
    
    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () {
       qwintoState.reinit();
      },
    );
  }
}
