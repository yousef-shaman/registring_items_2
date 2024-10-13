import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  final Function(Map<String, String>) onItemAdded;

  const AddItem({super.key, required this.onItemAdded});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final TextEditingController itemTitle = TextEditingController();
  final TextEditingController itemContent = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();

  //************************************ dispose "to dealing with controling after leaving the paeg"
  @override
  void dispose() {
    itemTitle.dispose();
    super.dispose();
  }
//======================================================================================================= Build Widget ======================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add item page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formstate,
          child: Column(
            children: [
              //************************************ TextFormField Title *****************************************************************
              TextFormField(
                controller: itemTitle,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "The field is empty";
                  }
                  if (value.length > 6) {
                    return "Just 6 characters allowed";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(borderSide: BorderSide(width: 20, color: Colors.brown)),
                ),
              ),
              const SizedBox(height: 15),
               //************************************ TextFormField content *****************************************************************
              TextFormField(
                // minLines: 6,
                controller: itemContent,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "The field is empty";
                  }
                  if (value.length > 100) {
                    return "Just 6 characters allowed";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "Content",
                  border: OutlineInputBorder(borderSide: BorderSide(width: 20, color: Colors.brown)),
                ),
              ),
              const SizedBox(height: 15),
              //************************************ ElevatedButton *****************************************************************
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                  padding: WidgetStatePropertyAll(EdgeInsets.all(20)),
                  fixedSize: WidgetStatePropertyAll(Size.fromWidth(500)),
                ),
                onPressed: () {
                  if (formstate.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Alert !!"),
                          content: const Text("Are you sure to add this item ?!"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                widget.onItemAdded({
                                  "Title": itemTitle.text,
                                  "Content": "Content placed here !!"
                                });
                                Navigator.of(context).pop();
                                Navigator.of(context).pop(); // Go back to HomePage
                              },
                              child: const Text("YES"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("NO"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text(
                  "Add item",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
