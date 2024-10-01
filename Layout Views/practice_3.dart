// Name and bio section
Padding(
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  child: Column(
    children: [
      Text(
        'John Doe',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8), // Spacing between name and bio
      Text(
        'Flutter Developer and UI/UX Enthusiast based in San Francisco.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
    ],
  ),
)
