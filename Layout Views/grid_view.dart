// Example of displaying items in a grid using GridView.count
GridView.count(
  crossAxisCount: 2, // Number of columns
  crossAxisSpacing: 10, // Spacing between columns
  mainAxisSpacing: 10, // Spacing between rows
  padding: EdgeInsets.all(16.0),
  children: List.generate(6, (index) {
    return Container(
      color: Colors.amberAccent,
      child: Center(
        child: Text(
          'Item ${index + 1}',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }),
  shrinkWrap: true, // Let the GridView take up only as much space as it needs
)
