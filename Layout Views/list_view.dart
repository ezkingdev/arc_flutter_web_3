// Example of using ListView to display a scrollable list of items
ListView(
  padding: EdgeInsets.all(16.0), // Adds padding around the entire list
  children: List.generate(10, (index) {
    // Generates a list of 10 items
    return ListTile(
      // A widget that displays a single row with optional leading/trailing icons and text
      leading: Icon(Icons.person), // Icon displayed at the start of the ListTile
      title: Text('Person ${index + 1}'), // Main text of the list item
      subtitle: Text('Subtitle for Person ${index + 1}'), // Secondary text
      trailing: Icon(Icons.arrow_forward), // Icon displayed at the end
      onTap: () {
        // Action to perform when the list item is tapped
        // For example, navigate to a detail page
      },
    );
  }),
)
