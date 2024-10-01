// Example of using LayoutBuilder to adapt layout based on constraints
LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    if (constraints.maxWidth > 600) {
      // Wide layout for larger screens
      return Row(
        children: [
          Expanded(child: _leftSideWidget()), // Custom widget on the left
          Expanded(child: _rightSideWidget()), // Custom widget on the right
        ],
      );
    } else {
      // Narrow layout for smaller screens
      return Column(
        children: [
          _leftSideWidget(), // Same custom widget stacked vertically
          _rightSideWidget(),
        ],
      );
    }
  },
)

// Placeholder methods for custom widgets
Widget _leftSideWidget() {
  return Container(
    color: Colors.orange,
    height: 200,
    child: Center(child: Text('Left Side')),
  );
}

Widget _rightSideWidget() {
  return Container(
    color: Colors.lightGreen,
    height: 200,
    child: Center(child: Text('Right Side')),
  );
}
