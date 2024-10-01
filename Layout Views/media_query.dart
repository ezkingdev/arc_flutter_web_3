// Example of using MediaQuery to create a responsive layout
Container(
  width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
  height: MediaQuery.of(context).size.height * 0.3, // 30% of screen height
  color: Colors.teal,
  child: Center(
    child: Text(
      'Responsive Container',
      style: TextStyle(color: Colors.white, fontSize: 24),
    ),
  ),
)
