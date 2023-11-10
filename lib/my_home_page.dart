import 'package:flutter/material.dart';
import 'package:signature_flutter/signature_custom_painter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Offset> _points = <Offset>[];
  double dx=0;
  double dy=0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            RenderBox? object = context.findRenderObject() as RenderBox;
            Offset localPosition =
            object.globalToLocal(details.globalPosition);
            _points =  List.from(_points)..add(localPosition);
          });
        },
        onPanEnd: (DragEndDetails details) => _points.add(Offset.infinite),
        child:  CustomPaint(
          painter:  Signature(points: _points),
          size: Size.infinite,
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        child:  const Icon(Icons.clear),
        onPressed: () => _points.clear(),
      ),
    );
  }
}