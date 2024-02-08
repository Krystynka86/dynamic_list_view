class SelectableItemData {
  final String program;
  final String description;
  final String iconImagePath;
  final String selectedTrailingImagePath;
  bool isSelected;

  SelectableItemData({
    required this.program,
    required this.description,
    required this.iconImagePath,
    required this.selectedTrailingImagePath,
    this.isSelected = false,
  });
}
