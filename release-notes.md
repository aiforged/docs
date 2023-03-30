---
layout: default
title: Release Notes
nav_order: 1
---

# Release Notes

## AIForged Studio 1.4

### Desktop
- The contents of the AIForged Studio window will now scale (up to a certain point) to fit the size of the user's desktop. This frees up a lot of screen real estate on devices with smaller or low resolution monitors.
- Users can now view and restore the settings history of any field definition in a service's "All Definitions" view. A new command button "View History" has been introduced for this.
- Users can now view and restore the settings / code history of any custom code. A new "History" tab has been added to the code editor. Please note that at this point in time, restoring code to a previous version will also restore other settings in the containing definition, such as replacement mappings and dictionary lookups.
- A new right-click context menu has been introduced to the document verification view. Right clicking on any black space in a document will bring up a context menu with the same options available under the "More..." command button.
- It is now possible to copy labels to your clipboard and paste them to any document in any service. New commands have been added for this.
    - Individual labels / tables can be copied by clicking a field and then selecting "Copy Label".
    - All the labels of a document can be copied by utilising the "Copy labels to clipboard" function available in the new right-click context menu, or "More..." command button.
    - Labels can be pasted in one of two ways:
        - "Paste custom labels from clipboard":
            - This will paste the custom labels as is and won't create new definitions. This is useful when copying labels within the same service.
        - "Paste custom labels from clipboard as new":
            - This will paste the custom labels as is and will create new definitions for each label. This is useful when copying labels from one service to another.
- Fixed issue with field value being overriden by verification control text automatically when simply viewing a field's value.
- Restricted editing a field's value to the text editor in the fieldvaluepopupcontrol.
- Some more polish to new features
- Added Export to CSV to export screen.
- Added Export to JSON to export screen.
- Started fixing table overlay MS Forms custom tables.
- Fixed totalscale calculation in the documentverification view.
- Fixed paramdefhierarchyview not saving changes.
- Implemented native search in the documents view, with an optional "Deep Search" function.
- Attempts at fixing "Access Violation" exception that rarely occurs duing app startup.
- Improved ProcessView log grid.
- Added DisplayMultiSelectActionSheet
- Removed devexpress dependency
- Improved Export screen
- Fixed scaling issue in labelling
- Various bug fixes / improvements
- Added initial implementation of copy and paste for individual labels.
- Started implementation of custom amount transfer between projects.
- Updated to WindowsAppSdk 1.2
- Fixed document Analysis view
- Added additional details in the transaction view to make it easier to identify services and nested services.

### WASM
A preview of the web version of AIForged Studio is available [Here](https://zealous-forest-0116e2803.2.azurestaticapps.net/)
