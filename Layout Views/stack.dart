// Example of overlaying widgets using Stack
Stack(
  children: [
    // Base widget
    Container(
      width: 300,
      height: 300,
      color: Colors.blueAccent,
    ),
    // Overlaid widget positioned at the center
    Center(
      child: Container(
        width: 150,
        height: 150,
        color: Colors.redAccent,
      ),
    ),
    // Positioned widget at specific coordinates
    Positioned(
      top: 20,
      left: 20,
      child: Icon(Icons.star, size: 50, color: Colors.white),
    ),
  ],
)
