// Example of stacking widgets vertically using Column
Column(
  mainAxisAlignment: MainAxisAlignment.center, // Center widgets vertically
  crossAxisAlignment: CrossAxisAlignment.start, // Align widgets to the start horizontally
  children: [
    Text('First Line', style: TextStyle(fontSize: 20)),
    Text('Second Line', style: TextStyle(fontSize: 20)),
    Text('Third Line', style: TextStyle(fontSize: 20)),
  ],
)
