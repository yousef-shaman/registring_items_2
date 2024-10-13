import 'package:flutter/material.dart';
import 'package:registring_items_2/models/users_model.dart';

class Profile extends StatefulWidget {
  final GetUsers userData;
  const Profile({super.key, required this.userData});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(100)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(widget.userData.picture!.large!),
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "${widget.userData.name!.first!} ${widget.userData.name!.last!}",
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            "${widget.userData.email}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Text("${widget.userData.gender}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isTap = true;
                            });
                          },
                          focusColor: isTap ? Colors.green : Colors.grey,
                          child: Chip(
                            label: Text(isTap ? "Following" : "Follow"),
                            backgroundColor:
                                isTap ? Colors.green : Colors.white,
                            labelStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          )),
          Expanded(
              child: Card(
            color: Colors.cyan,
            child: Container(
              height: 200,
            ),
          ))
        ],
      ),
    );
  }
}
