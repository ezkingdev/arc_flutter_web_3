import 'dart:convert';
import 'package:http/http.dart' as http;

class NotesApiProcessor {
  final String apiUrl = 'https://doggo-byc1.onrender.com/notes/';
  List<Note>? _cachedNotes; // Add a cache variable

  Future<List<Note>> fetchNotes() async {
    if (_cachedNotes != null) {
      print('Fetching notes from cache');
      return _cachedNotes!; // Return cached data if available
    }

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        _cachedNotes = data.map((json) => Note.fromJson(json)).toList(); // Store fetched data in cache
        print('Fetched notes from API and stored in cache');
        return _cachedNotes!;
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
        final newNote = Note.fromJson(jsonDecode(response.body));
        // Invalidate cache after creating a new note to fetch updated list
        _cachedNotes = null;
        print('Created new note and invalidated cache');
        return newNote;
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
      createdTime: "${_twoDigits(createdAt.hour)}:${_twoDigits(createdAt.minute)}",
      updatedAt: updatedAt,
      updatedDate: "${updatedAt.year}-${_twoDigits(updatedAt.month)}-${_twoDigits(updatedAt.day)}",
      updatedTime: "${_twoDigits(updatedAt.hour)}:${_twoDigits(updatedAt.minute)}:${_twoDigits(updatedAt.second)}",
    );
  }

  static String _monthText(int month) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  static String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}