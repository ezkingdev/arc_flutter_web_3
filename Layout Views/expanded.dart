// Example of using Expanded to divide space in a Row
Row(
  children: [
    Expanded(
      flex: 1, // Takes up 1 portion of the available space
      child: Container(color: Colors.red, height: 100),
    ),
    Expanded(
      flex: 2, // Takes up 2 portions of the available space
      child: Container(color: Colors.green, height: 100),
    ),
    Expanded(
      flex: 1, // Takes up 1 portion of the available space
      child: Container(color: Colors.blue, height: 100),
    ),
  ],
)
