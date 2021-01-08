import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      child: FlareActor(
        'assets/gear.flr',
        animation: 'spin',
        fit: BoxFit.contain,
      ),
    );
  }
}
