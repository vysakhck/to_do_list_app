import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/class.dart';
import 'package:to_do_list_app/profile.dart';

import 'Task.dart';

// ignore: camel_case_types
class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final List<Todo> _todoList = todoList;
  final _todoController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TextEditingController dateInputController = TextEditingController();
  String _endTime = '9.30 PM';
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();

  void onTaskCompleate(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void onTaskDelete(Todo todo) {
    setState(() {
      _todoList.remove(todo);
    });
  }

  void _addTodoItem(
    String todo,
  ) {
    setState(() {
      if (todo == '') return;
      todoList.add(Todo(
        id: DateTime.now().millisecondsSinceEpoch,
        todoText: todo,
        category: '',
        date: '',
        endTime: '',
        repeat: '',
        startTime: '',
        remaind: 0,
      ));
      _todoController.clear();
    });
  }

  int _selectedRemind = 5;

  String _selectedRepeat = "None";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      endDrawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xEF505BC1),
              ),
              accountName: Text(
                "Vysakh Ck",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              accountEmail: Text(
                "vysakh@gmail.com",
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/person.jpg'),
              ),
            ),
            ListTile(
              title: Text(
                'Setting',
                style: GoogleFonts.poppins(fontSize: 18),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFEAE7E7),
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 60),
              height: 280,
              width: double.infinity,
              // color: Color(0xF1505AB6),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xF1505AB6),
                    Color(0xEE8490F7),
                  ],
                ),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UserInfromationScreen(),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: ExactAssetImage('assets/person.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Text(
                      'Hi Vysakh',
                      style: GoogleFonts.prompt(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(22)),
              ),
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text('To-Do List',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xEF505BC1),
                  )),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _todoList.length,
                itemBuilder: (context, index) => Tasks(
                  todo: _todoList[index],
                  onCompleate: onTaskCompleate,
                  onDelete: onTaskDelete,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Material(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xF1505AB6),
                            Color(0xEE8490F7),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16)),
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => _buildBottomSheet(context));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(80, 60),
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.black,
                        alignment: Alignment.center,
                        shadowColor: Colors.transparent,
                      ),
                      child: Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }

  SingleChildScrollView _buildBottomSheet(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
        height: 580,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add task',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _addTodoItem(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xF1505AB6),
                      backgroundColor: Color(0xEE8490F7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999)),
                      // backgroundColor: const Color(0xF1505AB6),
                      minimumSize: Size(92, 42),
                      elevation: 0),
                  child: Text(
                    'Done',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              'Title',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              // margin: const EdgeInsets.only(left: 22),
              padding: const EdgeInsets.only(left: 22, top: 2),
              height: 42,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFF8C8A8A)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _todoController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Add a task',
                    suffixIcon: DropdownButton<String>(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      iconSize: 28,
                      underline: Container(height: 0),

                      // icon: const Icon(Icons.keyboard_arrow_down),
                      items: <String>['Personal', 'Home', 'Office']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    )),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Date',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              // margin: const EdgeInsets.only(left: 22),
              padding: const EdgeInsets.only(left: 22, top: 2),
              height: 42,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFF8C8A8A)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                // ignore: unnecessary_null_comparison
                readOnly: widget == null ? false : true,
                autofocus: false,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: DateFormat.yMd().format(_selectedDate),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2050));

                        if (pickedDate != null) {
                          dateInputController.text = pickedDate.toString();
                        }
                      },
                      icon: const Icon(Icons.calendar_month_rounded),
                    )),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start Time',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        // margin: const EdgeInsets.only(left: 22),
                        padding: const EdgeInsets.only(left: 22, top: 2),
                        height: 42,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xFF8C8A8A)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: _startTime,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _getTimeFromUser(isStartTime: true);
                                });
                              },
                              icon: Icon(Icons.access_time),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'End Time',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        // margin: const EdgeInsets.only(left: 22),
                        padding: const EdgeInsets.only(left: 22, top: 2),
                        height: 42,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xFF8C8A8A)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: _endTime,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    _getTimeFromUser(isStartTime: false);
                                  },
                                  icon: Icon(Icons.access_time))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Remind',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              // margin: const EdgeInsets.only(left: 22),
              padding: const EdgeInsets.only(left: 22, top: 2),
              height: 42,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFF8C8A8A)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "$_selectedRemind minutes early",
                    suffixIcon: DropdownButton<String>(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      iconSize: 28,
                      underline: Container(height: 0),
                      // icon: const Icon(Icons.keyboard_arrow_down),
                      items: <int>[10, 15, 20].map((int value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRemind = int.parse(newValue!);
                        });
                      },
                    )),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Repeat',
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              // margin: const EdgeInsets.only(left: 22),
              padding: const EdgeInsets.only(left: 22, top: 2),
              height: 42,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFF8C8A8A)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "$_selectedRepeat",
                    suffixIcon: DropdownButton<String>(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      iconSize: 28,
                      underline: Container(height: 0),
                      // icon: const Icon(Icons.keyboard_arrow_down),
                      items: <String>['None', 'Daily', 'Weekly', 'Monthly']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRepeat = newValue!;
                        });
                      },
                    )),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time canceld");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(':')[0]),
            minute: int.parse(_startTime.split(':')[1].split(' ')[0])));
  }
}
