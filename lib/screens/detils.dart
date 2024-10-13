

import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final Map data;
  const DetailsPage({super.key, required this.data});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

//======================================================================================================= Build Widget ======================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data["Title"]),
      ),

      body: Container(
        child: Image.asset("images/flutter.png"),
      ),
    );
  }
}