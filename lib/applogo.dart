import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class CommonLogo extends StatelessWidget {
  const CommonLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image:AssetImage('assets/images/drone.png'),width: 100),
        "Drone App".text.xl2.italic.make(),
        "Make A List of your task".text.light.white.wider.lg.make(),
      ],
    );
  }
}
