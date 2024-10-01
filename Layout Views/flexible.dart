// Example of using Flexible within a Row
Row(
  children: [
    Flexible(
      flex: 1, // Can shrink or expand, takes up 1 portion
      child: Container(color: Colors.purple, height: 100),
    ),
    Flexible(
      flex: 1, // Can shrink or expand, takes up 1 portion
      child: Text(
        'Some long text that might not fit in the available space.',
        overflow: TextOverflow.ellipsis, // Handle overflow
      ),
    ),
  ],
)
