import 'package:flutter/material.dart';
import 'package:marksheeet/student.dart';


class StudentEntryScreen extends StatefulWidget {
  StudentEntryScreen({Key? key}) : super(key: key);
  @override
  State<StudentEntryScreen> createState() => _StudentEntryScreenState();
}

class _StudentEntryScreenState extends State<StudentEntryScreen> {
  String? batch;
  late String name;
  late int api, android, iot;
  List<String> items = ['28 B', '28 A'];

  final _globalkey = GlobalKey<FormState>();
  List<Students> studentresultlist = [];
  addStudent(Students student) {
    setState(() {
      setState(() {
        studentresultlist.add(student);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Student Registration"),
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _globalkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    onChanged: (value) => {
                      if (value != "") {name = value.toString()}
                    },
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: "NAME",
                      hintText: "NAME",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "The input box is empty";
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 9.0, vertical: 4.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                            child: DropdownButton(
                              hint: const Text('select batch:'),
                              dropdownColor: Color.fromARGB(255, 232, 232, 234),
                              icon: const Icon(Icons.arrow_drop_down),
                              isExpanded: true,
                              iconSize: 36,
                              value: batch,
                              onChanged: (dynamic newValue) {
                                setState(() {
                                  batch = newValue;
                                });
                              },
                              items: items.map(
                                (String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    onChanged: (value) => {
                      if (value != "") {api = int.parse(value)}
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "API MARKS",
                      hintText: "API MARKS",
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 20.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "The input box is empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    onChanged: (value) => {
                      if (value != "") {android = int.parse(value)}
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "ANDROID MARKS",
                      hintText: "ANDROID MARKS",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "The input box is empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    onChanged: (value) => {
                      if (value != "") {iot = int.parse(value)}
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "IOT MARKS",
                      hintText: "IOT MARKS",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "The input box is empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // TextFormField(
                  //   onChanged: (value) => {
                  //     if (value != "") {batch = value} else {batch = 'new'}
                  //   },
                  //   keyboardType: TextInputType.number,
                  //   decoration: const InputDecoration(
                  //     labelText: "BATCH",
                  //     hintText: "BATCH",
                  //     border: OutlineInputBorder(),
                  //   ),
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return "The input box is empty";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 54, 244, 95)),
                      onPressed: () {
                        if (_globalkey.currentState!.validate()) {
                          setState(() {
                            Students student = Students(
                              name: name,
                              api: api,
                              android: android,
                              iot: iot,
                              answer:
                                  ((iot + api + android) / 300 * 100).round(),
                              batch: batch!,
                              resulttype: (iot < 40 && api < 40 && android < 40)
                                  ? "Fail"
                                  : "Pass",
                            );
                            addStudent(student);
                          });
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return (AlertDialog(
                                  title: const Text("Added Successfuly"),
                                  content: Icon(
                                    Icons.beenhere,
                                    color: Colors.green,
                                    size: 40.0,
                                  ),
                                  actions: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                          primary: Colors.green,
                                          backgroundColor: Color(0xFF0A0E21)),
                                      child: const Text(
                                        "OK",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ]));
                            },
                          );
                        }
                      },
                      child: const Text(
                        "Add Marks",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 92, 12, 241),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/view',
                            arguments: studentresultlist);
                      },
                      child: const Text(
                        "view Result",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
