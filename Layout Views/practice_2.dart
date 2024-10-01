// Circular profile picture overlapping the header
Transform.translate(
  offset: Offset(0, -50), // Move the widget up by 50 pixels
  child: CircleAvatar(
    radius: 50,
    backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your image path
  ),
)
