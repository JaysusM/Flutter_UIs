import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  CameraDescription _cameraDescription;

  CameraScreen(this._cameraDescription);

  @override
  State<StatefulWidget> createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  CameraController controller;
  @override
  void initState() {
    super.initState();
    controller = CameraController(widget._cameraDescription, ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      print("not connected");
      return new Container();
    }
    return new Container(
        child: new AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: CameraPreview(controller),
        ));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}