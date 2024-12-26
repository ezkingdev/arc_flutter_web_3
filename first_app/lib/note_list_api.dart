import 'dart:convert';
import 'package:http/http.dart' as http;

class NotesApiProcessor {
  final String apiUrl = 'https://doggo-byc1.onrender.com/notes/';

  Future<List<Note>> fetchNotes() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Note.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load notes');
      }
    } catch (e) {
      throw Exception('Error fetching notes: $e');
    }
  }

  Future<Note> createNote({required String title, required String content, required String color}) async {
    try {
      final response = await http.post(Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'title': title,
            'content': content,
            'color': color,
          }));

      if (response.statusCode == 201) {
        return Note.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create note');
      }
    } catch (e) {
      throw Exception('Error creating note: $e');
    }
  }
}





class Note {
  final String title;
  final String content;
  final bool completed;
  final String color;
  final int id;
  final DateTime createdAt;
  final String createdDate;
  final String createdTime;
  final DateTime updatedAt;
  final String updatedDate;
  final String updatedTime;

  Note({
    required this.title,
    required this.content,
    required this.completed,
    required this.color,
    required this.id,
    required this.createdAt,
    required this.createdDate,
    required this.createdTime,
    required this.updatedAt,
    required this.updatedDate,
    required this.updatedTime,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    final createdAt = DateTime.parse(json['created_at']);
    final updatedAt = DateTime.parse(json['updated_at']);

    return Note(
      title: json['title'],
      content: json['content'],
      completed: json['completed'],
      color: json['color'],
      id: json['id'],
      createdAt: createdAt,
      createdDate: "${createdAt.day} ${_monthText(createdAt.month)}, ${createdAt.year}",
      createdTime: "${createdAt.hour}:${createdAt.minute}",
      updatedAt: updatedAt,
      updatedDate: "${updatedAt.year}-${_monthText(updatedAt.month)}-${updatedAt.day}",
      updatedTime: "${updatedAt.hour}:${updatedAt.minute}:${updatedAt.second}",
    );
  }





  static String _monthText(int month) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}