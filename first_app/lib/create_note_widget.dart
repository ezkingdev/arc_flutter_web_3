import 'package:flutter/material.dart';
import 'note_list_api.dart';

class CreateNoteWidget extends StatefulWidget {
  const CreateNoteWidget({super.key});

  @override
  _CreateNoteWidgetState createState() => _CreateNoteWidgetState();
}

class _CreateNoteWidgetState extends State<CreateNoteWidget> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _content;
  Color _selectedColor = const Color(0xFFade8f4);

  final List<Color> _colorOptions = [
    Color(0xFFffe5ec),
    Color(0xFFc7f9cc),
    Color(0xFFade8f4),
    Color(0xFFefefd0),
    Color(0xFFc8b6ff),
    Color(0xFFffe5b4),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton(
            elevation: 0,
            backgroundColor: const Color(0xff1f115e),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StatefulBuilder(
                    builder: (context, setState) => Scaffold(
                      appBar: AppBar(
                        title: const Text(
                          'Create Note',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
                            child: const Text(
                              'Create a new note.',
                              style: TextStyle(
                                fontSize: 60.0,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Sora',
                                height: 1.0,
                              ),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Title',
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a title';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) => _title = value!,
                                  ),
                                  const SizedBox(height: 16.0),
                                  TextFormField(
                                    maxLines: 12,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Content',
                                      filled: true,
                                      fillColor: Color(0xFFE0F7FA),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some content';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) => _content = value!,
                                  ),
                                  const SizedBox(height: 48.0),
                                  Wrap(
                                    alignment: WrapAlignment.spaceBetween,
                                    children: _colorOptions.map((color) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedColor = color;
                                          });
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: color,
                                            shape: BoxShape.circle,
                                            border: _selectedColor == color
                                                ? Border.all(
                                              color: Colors.black,
                                              width: 4.0,
                                            )
                                                : Border.all(
                                              color: Colors.transparent,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                  const SizedBox(height: 48.0),
                                  TextButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        try {
                                          await NotesApiProcessor().createNote(
                                            title: _title,
                                            content: _content,
                                            color: _colorOptions.contains(_selectedColor)
                                                ? '#${_selectedColor.value.toRadixString(16).substring(2)}'
                                                : throw Exception('Invalid color selected'),
                                          );
                                          Navigator.of(context).pop();
                                        } catch (e) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Error creating note: $e')),
                                          );
                                        }
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: const Color(0xff00c06b),
                                      minimumSize: Size(double.infinity, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16.0),
                                      ),
                                    ),
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.notes,
              size: 20.0,
              color: Color(0xFFff9800),
            ),
          ),
        ),
      ],
    );
  }
}
