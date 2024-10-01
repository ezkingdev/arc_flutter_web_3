// Example of wrapping widgets using Wrap
Wrap(
  spacing: 8.0, // Horizontal spacing between children
  runSpacing: 4.0, // Vertical spacing between runs
  children: List.generate(8, (index) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: Text('${index + 1}'),
      ),
      label: Text('Chip ${index + 1}'),
    );
  }),
)
