import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:substring_highlight/substring_highlight.dart';

class Vegetabledetails extends StatefulWidget {
  const Vegetabledetails({super.key});

  @override
  State<Vegetabledetails> createState() => _VegetabledetailsState();
}

class _VegetabledetailsState extends State<Vegetabledetails> {
  bool isLoading = false;

  late List<String> autoCompleteData;

  late TextEditingController controller = TextEditingController();
  late TextEditingController controller1 = TextEditingController();

  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = true;
    });

    final String stringData =
        await rootBundle.loadString("assets/vegetables.json");

    final List<dynamic> json = jsonDecode(stringData);

    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteData = jsonStringData;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAutoCompleteData();
  }

  @override
  Widget build(BuildContext context) {
    var gram = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.only(right: 18.0, top: 40),
          child: ListView(
            children: [
              SizedBox(
                height: 40,
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Autocomplete(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<String>.empty();
                        } else {
                          return autoCompleteData.where((word) => word
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()));
                        }
                      },
                      optionsViewBuilder:
                          (context, Function(String) onSelected, options) {
                        return Material(
                          elevation: 4,
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final option = options.elementAt(index);

                              return ListTile(
                                // title: Text(option.toString()),
                                title: SubstringHighlight(
                                  text: option.toString(),
                                  term: controller.text,
                                  textStyleHighlight: const TextStyle(
                                      fontWeight: FontWeight.w700),
                                ),
                                subtitle: const Text("This is subtitle"),
                                onTap: () {
                                  onSelected(option.toString());
                                },
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: options.length,
                          ),
                        );
                      },
                      onSelected: (selectedString) {
                        debugPrint(selectedString);
                      },
                      fieldViewBuilder:
                          (context, controller, focusNode, onEditingComplete) {
                        this.controller = controller;

                        return TextField(
                          controller: controller,
                          focusNode: focusNode,
                          onEditingComplete: onEditingComplete,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            hintText: "Search Vegetable",
                            prefixIcon: const Icon(Icons.search),
                          ),
                        );
                      },
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "OR",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: ((value) {
                  setState(() {
                    value = controller1.text;
                  });
                }),
                controller: controller1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.yellow[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.yellow[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.yellow[300]!),
                    ),
                    hintText: "Add vegetable",
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller1.clear();
                        },
                        icon: Icon(Icons.cancel_sharp))),
              ),
              MaterialButton(
                onPressed: () {},
                child: const Text("ADD"),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Card(
                  color: Colors.grey.withOpacity(0.5),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 30,
                        ),
                      ),
                      Text(
                        controller1.text,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              gram = gram + 100;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            size: 40,
                          )),
                      Text(
                        '$gram',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("(gram)",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            size: 40,
                          )),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
