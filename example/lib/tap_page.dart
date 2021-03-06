import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';

class TapPage extends StatefulWidget {
  @override
  _TapPageState createState() => _TapPageState();
}

class _TapPageState extends State<TapPage> {
  ARKitController arkitController;

  @override
  void dispose() {
    arkitController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Tap Gesture Sample')),
        body: Container(
          child: ARKitSceneView(
            enableTapRecognizer: true,
            onARKitViewCreated: onARKitViewCreated,
          ),
        ),
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onTap = (name) => onTapHandler(name);

    final material = ARKitMaterial(
        diffuse: ARKitMaterialProperty(
      color: Colors.yellow,
    ));
    final sphere = ARKitSphere(
      name: 'yellow sphere',
      position: const ARKitVector3(0, 0, -0.5),
      materials: [material],
      radius: 0.1,
    );
    this.arkitController.add(sphere);
  }

  void onTapHandler(String name) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(content: Text('You tapped on $name'));
      },
    );
  }
}
