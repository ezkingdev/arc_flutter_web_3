import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'note_list_api.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 32.0),
              child: Text(
                'Your Notes',
                style: GoogleFonts.sora(
                  fontSize: 88.0,
                  fontWeight: FontWeight.w300,
                  height: 0.95,
                  color: Colors.white,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[800]!),
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xFFC5E1A5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Text('#Personal',style: TextStyle(fontSize: 16, color: Colors.black),),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[800]!),
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xFFC9E4CA),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Text('#Team',style: TextStyle(fontSize: 16, color: Colors.black),),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[800]!),
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xFFF7D2C4),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Text('#Work',style: TextStyle(fontSize: 16, color: Colors.black),),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[800]!),
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xFFD7BDE2),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Text('#Ideas',style: TextStyle(fontSize: 16, color: Colors.black),),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[800]!),
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xFFA1C9F2),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Text('#Learning',style: TextStyle(fontSize: 16, color: Colors.black),),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[800]!),
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color(0xFFE4D6F5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Text('#Play',style: TextStyle(fontSize: 16, color: Colors.black),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            FutureBuilder<List<Note>>(
              future: NotesApiProcessor().fetchNotes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final notes = snapshot.data!;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    padding: const EdgeInsets.all(0.0),
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return _buildBottomSheet(note);
                            },
                          );
                        },
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Color(int.parse(note.color.replaceFirst('#', '0xff'))),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  note.title,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  note.content,
                                  style: const TextStyle(fontSize: 12.0),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}',
                        style: const TextStyle(fontSize: 16)),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(Note note) {
    return SizedBox(
      height: double.infinity - 100,
      child: CupertinoPageScaffold(
        backgroundColor: Color(int.parse(note.color.replaceFirst('#', '0xff'))),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 64.0,
                ),
                Text(
                  note.title,
                  style: const TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  note.content,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          note.completed
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: note.completed ? Colors.green : Colors.grey,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          note.completed ? 'Completed' : 'Pending',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: note.completed ? Colors.green : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Text(
                        note.createdDate.toString(),
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
