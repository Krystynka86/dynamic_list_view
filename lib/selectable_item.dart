import 'package:flutter/material.dart';

// Create a custom widget for selectable items
class SelectableItem extends StatefulWidget {
  final String program;
  final String description;
  final String iconImagePath;
  final String selectedTrailingImagePath;
  final Function(bool) onSelect;
  final bool isSelected;

// Constructor for the SelectableItem widget
  const SelectableItem({
    Key? key,
    required this.program,
    required this.description,
    required this.iconImagePath,
    required this.selectedTrailingImagePath,
    required this.onSelect,
    required this.isSelected,
  }) : super(key: key);

// Create state for the SelectableItem widget
  @override
  _SelectableItemState createState() => _SelectableItemState();
}

// State class for the SelectableItem widget
class _SelectableItemState extends State<SelectableItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // If the item is selected, disable onTap functionality
      onTap:
          widget.isSelected ? null : () => widget.onSelect(!widget.isSelected),

          // Display the leading icon/image based on selection state
      leading: widget.isSelected
          ? Opacity(
              opacity: 0.5,
              child: Image.asset(widget.iconImagePath),
            )
          : Image.asset(widget.iconImagePath),

          // Display the program name and add a gap if the item is selected
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.program),
          if (widget.isSelected)
            const SizedBox(height: 4.0), // Add 4px gap when isSelected is true
        ],
      ),

      // Display the description and add a gap if the item is selected
      subtitle: widget.isSelected
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.description),
                const SizedBox(
                    height: 4.0), // Add 4px gap when isSelected is true
              ],
            )
          : null,

          // Display the trailing icon/image based on selection state, set to null if not selected
      trailing: widget.isSelected
          ? Opacity(
              opacity: 0.5,
              child: Image.asset(widget.selectedTrailingImagePath),
            )
          : null,
      enabled: !widget.isSelected,
    );
  }
}
