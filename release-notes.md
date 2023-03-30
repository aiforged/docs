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
- Fixed issue with field value being automatically overriden by an editor's text when simply viewing a field's value.
- Restricted editing a field's value to the text editor in the field value popup.
- Improved the document's value export screen, which can be found in the Inbox, Outbox or Training Box by clicking on the "Export" command button and selecting "Export Screen". Enabling the detailed view will now properly render any tables and allow them to be exported to Excel.
- Improved the Excel export function in the export screen.
- Added Export to CSV to export screen.
- Added Export to JSON to export screen.
- Fixed an issue where label scaling would be incorrect if a document consisted of both portrait and landscape orientated pages.
- Improved the experience when creating custom tables during custom labelling.
- Implemented native search in the documents view, with an optional "Deep Search" function. The "Deep Search" function will search within the extracted values of processed documents. The search can take some time if there are a large number of documents to search through or if the documents have a large number of results.
- New methods to work with tables have been added to the AIForged SDK which are now available in the code editor.
- Attempts at fixing "Access Violation" exception that rarely occurs duing app startup.
- Added functionality to filter log messages in the document process popup.
- Removed the ability for users to register themselves. It is now necessary for AIForged consultants or partners to register new users.
- It is now possible to transfer custom bundle amounts between projects and services in the user group management screen.
- Added additional details in the transaction view to make it easier to identify services and nested services.
- Migrated to a unified codebase that allows us to compile and publish both our desktop and web versions of AIForged Studio with similar features between the two versions.
- Major performance improvements.
- Various bug fixes.

### WASM
A preview of the web version of AIForged Studio is available [Here](https://studio.aiforged.com/)
Please remember this is a preview version and may not be stable and is still undergoing performance optimizations.

## UIPath Activities 1.5.1176.1128

- Added export to CSV List activity. This activity allows your process to collect and export the extracted values for a given list of document Ids to a list of delimeted strings.
- Added export to CSV file actvity. This activity allows your process to collect and export the extracted values for a given list of document Ids to a CSV text file.
- Added export to DataTable file actvity. This activity allows your process to collect and export the extracted values for a given list of document Ids to a DataTable object.


