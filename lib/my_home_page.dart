import 'package:flutter/material.dart';
import 'selectable_item.dart';
import 'app_strings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedItemId = -1; // Initialize with an invalid ID

  @override
  Widget build(BuildContext context) {
    // List of maps containing data for each selectable item
    List<Map<String, dynamic>> items = [
      // Define data for each selectable item
      {
        "program": AppStrings.programDryCottonEco,
        "description": AppStrings.programDryCottonEcoDesc,
        "iconImagePath": 'icons/Cotton.png',
        "selectedTrailingImagePath": 'icons/iconCheckbox.png',
        "isSelected": false,
      },
      {
        "program": AppStrings.programDryCotton,
        "description": AppStrings.programDryCottonDesc,
        "iconImagePath": 'icons/Cotton.png',
        "selectedTrailingImagePath": 'icons/iconCheckbox.png',
        "isSelected": false,
      },
      {
        "program": AppStrings.programDrySynth,
        "description": AppStrings.programDrySynthDesc,
        "iconImagePath": 'icons/Synthetics.png',
        "selectedTrailingImagePath": 'icons/iconCheckbox.png',
        "isSelected": false,
      },
      {
        "program": AppStrings.programDryMix,
        "description": AppStrings.programDryMixDesc,
        "iconImagePath": 'icons/icon.png',
        "selectedTrailingImagePath": 'icons/iconCheckbox.png',
        "isSelected": false,
      },
      {
        "program": AppStrings.programDryDelicate,
        "description": AppStrings.programDryDelicateDesc,
        "iconImagePath": 'icons/Delicates.png',
        "selectedTrailingImagePath": 'icons/iconCheckbox.png',
        "isSelected": false,
      },
      {
        "program": AppStrings.programDrySports,
        "description": AppStrings.programDrySportsDesc,
        "iconImagePath": 'icons/Sport.png',
        "selectedTrailingImagePath": 'icons/iconCheckbox.png',
        "isSelected": false,
      },
      {
        "program": AppStrings.programDryBed,
        "description": AppStrings.programDryBedDesc,
        "iconImagePath": 'icons/Bedding.png',
        "selectedTrailingImagePath": 'icons/iconCheckbox.png',
        "isSelected": false,
      },
    ];

    return Theme(
      data: Theme.of(context),
      child: Scaffold(
        //backgroundColor: Colors.grey[200],
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Card(
              elevation: 0, // Set elevation to 0 to remove shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0), // Set top and bottom padding
                    shrinkWrap: true, // Enable shrinkWrap
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable scrolling
                    itemCount: items.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (context, index) {
                      return SelectableItem(
                        // Pass data to the SelectableItem widget
                        program: items[index]["program"]!,
                        description: items[index]["description"]!,
                        iconImagePath: items[index]["iconImagePath"]!,
                        selectedTrailingImagePath: items[index]
                            ["selectedTrailingImagePath"]!,
                            // Callback function when an item is selected
                        onSelect: (isSelected) {
                          setState(() {
                            if (isSelected) {
                              // Deselect the previous item
                              if (selectedItemId != -1) {
                                items[selectedItemId]["isSelected"] = false;
                              }
                              selectedItemId = index;
                            } else {
                              // Reset selected item ID if item is deselected
                              selectedItemId = -1;
                            }
                            // Update the isSelected status for the current item
                            items[index]["isSelected"] = isSelected;
                          });
                        },
                        // Check if the current item is selected
                        isSelected: index == selectedItemId,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
