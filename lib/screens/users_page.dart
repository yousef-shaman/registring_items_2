// gallery.dart
import 'package:flutter/material.dart';
import 'package:registring_items_2/models/users_model.dart';
import 'package:registring_items_2/screens/profile.dart';
import 'package:registring_items_2/services/api_service.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  ApiService api = ApiService();
  List<GetUsers> user = [];
  bool isTap = false;

  @override
  void initState() {
    getPhotos();
    super.initState();
  }

  Future<void> getPhotos() async {
    final response = await api.getUsers();
    setState(() {
      user = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: user.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.cyan,
            ))
          : ListView.builder(
              itemCount: user.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      // style: ListTileStyle(),

                      contentPadding: const EdgeInsets.all(15),
                      title: Text(
                          "${user[index].name!.first} ${user[index].name!.last}"),
                      leading: CircleAvatar(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              user[index].picture!.medium!,
                            )),
                      ),

                      trailing: InkWell(
                        onTap: () {
                          setState(() {
                            isTap = true;
                          });
                        },
                        child: Chip(
                          label: Text(isTap ? "Following" : "Follow"),
                          color: WidgetStatePropertyAll(
                              isTap ? Colors.green : Colors.white),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Profile(
                              userData: user[index],
                            )));
                  },
                );
              },
            ),
    );
  }
}
