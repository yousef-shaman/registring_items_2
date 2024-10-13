import 'package:flutter/material.dart';

class CustomCounterWidget extends StatefulWidget {
  final int initialCounter;
  final Function(int) onCounterChanged;

  const CustomCounterWidget({
    super.key,
    required this.initialCounter,
    required this.onCounterChanged,
  });

  @override
  State<CustomCounterWidget> createState() => _CustomCounterWidgetState();
}

class _CustomCounterWidgetState extends State<CustomCounterWidget> {
  //************************************ Variable *****************************************************************
  late int _counter;
  String _counterLabel = "Grid";

  //************************************ Methods *****************************************************************
  //===================================================================== initState function ====================================================================================
  @override
  void initState() {
    super.initState();
    _counter = widget.initialCounter;
  }

  void _incrementCounter() {
    setState(() {
      if (_counter < 3) {
        _counter++;
        _counterLabel = "Grid";
      } else {
        _counterLabel = "maximum is";
      }
      widget.onCounterChanged(_counter);
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
        _counterLabel = "Grid";
      } else {
        _counterLabel = "minimum is";
      }
      widget.onCounterChanged(_counter);
    });
  }

//======================================================================================================= Build Widget ======================================================================
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(color: Colors.amber, width: 6),
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            child: IconButton(
              onPressed: _incrementCounter,
              icon: const Icon(
                Icons.add,
                size: 30,
              ),
            ),
          ),
          Text(
            "$_counterLabel : $_counter",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(color: Colors.amber, width: 6),
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            child: IconButton(
              onPressed: _decrementCounter,
              icon: const Icon(
                Icons.remove,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
