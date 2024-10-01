// Header image with full width
Container(
  height: 200,
  width: double.infinity, // Full width of the parent
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/header.jpg'), // Replace with your image path
      fit: BoxFit.cover, // Cover the entire container
    ),
  ),
)
