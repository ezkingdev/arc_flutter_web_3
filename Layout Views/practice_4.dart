// Row of social media icons
Padding(
  padding: EdgeInsets.symmetric(vertical: 16.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center, // Center the row
    children: [
      IconButton(
        icon: Icon(Icons.facebook),
        iconSize: 32,
        onPressed: () {
          // Add your onPressed code here!
        },
      ),
      SizedBox(width: 16), // Spacing between icons
      IconButton(
        icon: Icon(Icons.twitter),
        iconSize: 32,
        onPressed: () {
          // Add your onPressed code here!
        },
      ),
      SizedBox(width: 16),
      IconButton(
        icon: Icon(Icons.linkedin),
        iconSize: 32,
        onPressed: () {
          // Add your onPressed code here!
        },
      ),
    ],
  ),
)
