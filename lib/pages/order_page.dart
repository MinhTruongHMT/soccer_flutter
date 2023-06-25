import 'package:flutter/material.dart';

import '../components/Multiselect_Dropdown_Checkbox.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TimeOfDay time = TimeOfDay.now();
  TextEditingController _dateController = TextEditingController();
  List<String> _selectedItems = [];
  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> items = [
      'Nước suối',
      'Nước kháng',
      'Bánh mì',
      'Nước tăng lực'
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.store_mall_directory), onPressed: () {}),
          // appBar: AppBar(
          //     leading: IconButton(
          //   icon: const Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // )),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${time.hour}:${time.minute}',
                      style: const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                              context: context, initialTime: time);
                          if (newTime == null) return;

                          setState(() => time = newTime);
                        },
                        child: const Text("Select Time"))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: TextField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                        labelText: "DATE",
                        filled: true,
                        prefixIcon: Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    readOnly: true,
                    onTap: () {
                      _selectDate();
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: TextField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                        labelText: "DATE",
                        filled: true,
                        prefixIcon: Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    readOnly: true,
                    onTap: () {
                      _selectDate();
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _showMultiSelect,
                  child: const Text(
                    'Menu',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Wrap(
                  children: _selectedItems
                      .map((e) => Chip(
                            label: Text(e),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ));
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_picked == null) return;
    setState(() {
      _dateController.text = _picked.toString().split(" ")[0];
    });
  }
}
