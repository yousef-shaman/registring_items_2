import 'package:flutter/material.dart';
import 'package:registring_items_2/screens/add_item.dart';
import 'package:registring_items_2/screens/detils.dart';
import 'package:registring_items_2/screens/users_page.dart';
import 'package:registring_items_2/widgets/custom_counter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //************************************ Variable *****************************************************************
  List<Map<String, String>> items = [];
  int counter = 2;

  //************************************ Methods *****************************************************************
  
  

  void _handleCounterChange(int newCounter) {
    setState(() {
      counter = newCounter;
    });
  }

//======================================================================================================= Build Widget ======================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //===================================================================== Appbar Widger ====================================================================================
        appBar: AppBar(
          title: const Text("Registring Items"),
          leading: IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UsersPage()));
            
          }, icon: const Icon(Icons.person_add, size: 30,)),
        ),
        //===================================================================== FloatingActionButton ====================================================================================
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddItem(
                  onItemAdded: (item) {
                    setState(() {
                      items.add(item);
                      print("=========================================================================================================== $item  ==  ${item.length}");
                      print("=========================================================================================================== $items  ==  ${items.length}");
                    });
                  },
                ),
              ),
            );
          },
        ),

        //===================================================================== Column ====================================================================================
        body: Column(
          children: [
            CustomCounterWidget(
              initialCounter: counter,
              onCounterChanged: _handleCounterChange,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: SizedBox(
                  height: 650,
                  //************************************ GridView.builder *****************************************************************
                  child: items.isNotEmpty
                      ? GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: counter),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            //++++++++++++++++++ Card is the widget that's being repeat
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                          data: items[index],
                                        )));
                              },
                              child: Card(
                                color: Colors.cyan,
                                margin: const EdgeInsets.all(20),
                                child: Center(
                                  child: Text(
                                    items[index]["Title"] ?? "No Data",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      // if the condition return false --------------------------------------------- !!!!
                      : const Center(
                          child: Text(
                            "No Item Added yet !",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        )),
            ),
          ],
        ));
  }
}
