---
layout: default
title: Release Notes
nav_order: 1
---

# Release Notes

## AIForged Studio 1.5.4 (06-10-2023)
### Desktop
- Enhancement: Improved the speed and overall stability of the document extraction export view.
- Enhancement: Confidence color is now calculated on an improved "linear" scale.
- Enhancement: Major improvements to Code Insight / Code Completion / Intellisense in the Custom Code editor. More enhancements to come.
- Enhancement: Added optional duplicate key value check when importing values from CSV in the Custom Dataset editor.
- Enhancement: User administration: User impersonation checks will now correctly use the impersonated user's Id to check permissions when switching / navigating between views.
- Bug Fix: Fixed issue in the document designer / document verification view, where manipulating a table field marked for deletion would no longer delete that field.
- Bug Fix: Deleted fields are no longer drawn in the verification controls.
- Bug Fix: Fixed issue where deleted fields would sometimes still be drawn on the document overlay.
- Bug Fix: Fixed issue that would cause the Studio to crash when filtering more than once in the Custom Dataset editor.
- Bug Fix: Fixed an issue where total usage cost would not be correctly displayed in the document cost analysis view.
- Bug Fix: Fixed an issue that would prevent a user from successfully linking an external login provider from the user profile view.
- Bug Fix: Fixed an issue that would prevent the MFA QR Code from being scanned when dark theme is enabled.
- Bug Fix: Fixed an issue that would prevent the MFA QR Code from being scanned using the Microsoft Authenticator App.
- Bug Fix: Fixed grid line settings not being honoured when enabled in a user's profile.
- Bug Fix: Fixed an issue where the Custom Dataset editor's new row visuals would not correctly update after clicking the accept row changes button.
- Bug Fix: Fixed multiple other issues related to adding and committing new rows in the Custom Dataset editor.
- Bug Fix: Fixed issue that would cause the Studio to freeze in the Custom Code editor when an enum's type could not be determined internally.
- Bug Fix: Fixed multiple internal issues related to JSON interop deserialization in the Custom Code editor.
- Bug Fix: Fixed SemanticZoom not correctly zooming to the selected item. This affected views and dialogs such as the Service Type Select dialog when selecting a service type to be added to a project.
- Bug Fix: Fixed scrollbars not visible in the SemanticZoom control.
- Bug Fix: Fixed stability and reliability of data persistence between views.
- Bug Fix: Fixed an issue that would cause the "Actions..." button to not be enabled when selected a node in the Service Definitions view.
- Bug Fix: Fixed an issue that would cause the whole tree to redraw in the Service Definitions view when a simple setting was changed.
- Bug Fix: Fixed confusing visual feedback when labels are re-scaled to match the provider scale when saving custom labels in the Document Designer \ Document Verification view.
- Bug Fix: Fixed an issue where the navigation breadcrumbs were difficult to click.
- Bug Fix: Fixed an issue where adding / removing a child service from a service would not update visuals.
- Bug Fix: Fixed multiple issues that would prevent a smooth UX when completing wizard steps using the next step button.
- Bug Fix: Fixed an issue where the Dependency Service swap function would show the service type select dialog twice.
- Bug Fix: Fixed an issue where the verification controls would not draw in the Document Designer / Document verification view if a table contained an invalid layout.
- Bug Fix: Fixed an issue where the "Delete Checked" command button would not be enabled in the Workflow Grid View when selecting a work item.
- Bug Fix: Fixed an internal exception that could occur when a user is automatically logged out when their session is expired. This would cause the user's profile image to not be cleared.
- Improved startup load speed.
- Other bug fixes and improvements

- ## UIPath Activities 1.5.1366.1020 (27-09-2023)

- Added QA work item activities to the workflow category.
- Updated AIForged SDK which introduced some additional parameters for some activities.

## AIForged Studio 1.5.3 (15-09-2023)
### Desktop
- New Feature: Added new basic drilldown view to "Wallets & Billing" drilldown views with more relevant information at a glance.
- New Feature: Added a toggle to the user profile to switch between basic and advanced views for the "Wallets & Billing" and related views.
- Enhancement: Added some additional information in the "Wallets & Billing" header.
- Enhancement: Major speed improvements when drilling into transactions.
- Enhancement: Completely overhauled virtual table overlays in the document designer / document verification view.
- Enhancement: Microsoft Forms: in the HITL document verification / document designer view: for custom tables, cell information is returned for cells with and without extracted values. Cells without values do not contain any location info and thus do not appear in the document overlay. When deleting rows, cells without  location info were not flagged for deletion, only visible cells were flagged for deletion. These cells are now included when flagging row cells for deletion and will be deleted when saving your changes.
- Enhancement: Added additional training options configuration for supported services (Currently only Microsoft Forms: Custom Invoices is supported). Training options can be set from a project's categories view by selecting a category and clicking on the "Training Options" command button.
- Bug Fix: Fixed issue with DocumentView filters not loading correctly when navigating without tabs.
- Other bug fixes and improvements

## AIForged Studio 1.5.2 (08-09-2023)
### Desktop
- Added correct protocol activation for accepting group invites.
- Added new view to allow users to accept group invites.
- Added training options configuration to the project categories view. (Currently this is only utilised by Microsoft Forms with Custom Invoices).

## AIForged Studio 1.5.0 (01-09-2023)
### Desktop
- Re-wrote app initialization to take advantage of newer WinUI APIs and to ensure alignment with WinUI best practices.
- Increased available window real estate by refactoring the app layout, including breadcrumb positioning, etc.
- Implemented persisted data for certain project data. This means that for example: if a project is open over multiple tabs, data will be synchronized across the tabs.
- Fixed issue where definition value updates were not immediately visible in the definitions tree grid.
- Fixed issue with verification values not being saved when verification controls are hidden.
- Fixed issue with Parameter Definition Options not serializing correctly.
- Fixed issue with missing user preferences on new user accounts
- UX improvements to the Service Wizard.
- Added additional export options to the custom dataset editor.
- UX improvements to the custom dataset editor.
- Custom labelling / HITL table manipulation bug fixes.
- Custom labelling / HITL canvas sizing issues fixed for documents with small dimensions
- Implemented optional tab-free navigation. This can be enabled by disabling the "Use Default Tab Navigation" setting in General User Profile settings.
- Fixed issue with card count in HITL Kanban View.
- Implemented adding multiple tables using the same Parameter Definition on the same page.
- Restricted the admin roles available to a user administrator when editing / creating a user's profile.
- Fixed issues with switching the current application theme.
- Added double click add and remove shortcuts to the Table Designer.
- Fixed issue with teaching tips opening despite being globally disabled.
- Implemented "Quick Dependency Switch" for dependency services.
- Added additional progress feedback when saving editor changes.
- Fixed issues with copying and pasting tables from the clipboard during custom labelling / HITL verification.
- Implemented generic dataset wizard step for new generic dataset wizard type.
- Improved row selection styling in datagrids with action buttons.
- Implemented new "Wallets & Billing" view that allows a user to get an immediate sense of available credits, total usage and credit deposits for their account/s. Users can have access to multiple wallets and can switch between these wallets to view their statistics.
- Overhaul transactions views which now forms part of "Wallets & Billing".
- Added a refresh function to the document designer's category documents view.
- Complete overhaul over the label value popup control to only show relevant information and provide an improved UX.
- The verification value editor now works with multi-line text.
- Added many new keyboard shortcuts to the document designer and some other views. Keyboard shortcuts are displayed in tooltips / menu items where available.
- In the document verification view / HITL: The Verification -> Publish function now correctly honours publish related settings configured in a service.
- Improved switching between themes.
- Many other bug fixes and performance improvements.
  
## AIForged Studio 1.4.6 (03-07-2023)
### Desktop
- Further refinements to the transaction reporting views
- Added group filter to transactions view
- Fixed issue with refresh login function
- New user accounts created from the group management view will now be auto-activated
- Other bug fixes / improvements

## AIForged Studio 1.4.4 (23-06-2023)
### Desktop
- Added orphaned transactions to transactions details view.
- Minor improvements to workflow.
- Fixed publish bug when rerunning rules in verification
- Improved tesseract implementation
- Other improvements  / fixes

## AIForged Studio 1.4.3 (19-06-2023)
### Desktop
- Hotfix for regression in document extraction results Export Screen.

## AIForged Studio 1.4.2 (15-06-2023)
### Desktop
- Hotfix for regression in Add Service Type Selection dialog.

## AIForged Studio 1.4.1 (14-06-2023)

### Desktop
- Consolidated the user group management into a single view for managing a specifc group. Group managers can now view and manage a group's users in a single view, with the functionality of drilling into a users roles and permissions per project and service in the managed group. It is now easier to invite users to a group via the **Add Users** -> **Invite External User** function. This function simply requires and email address for the user to invite. The invited user will receive an email notifying them of the invite, and requesting them to accept it.
- Implemented specific permissions check for users that can label documents and users that can train documents (in the workflow and in the wizard). This means that additional roles can be implemented that split the responsibility of labelling and training documents between 2 or more users.
- Further improved permissions in the document verification view (workflow, boxes and wizard) to align with enhanced AIForged security.
- Added default option to a document's Cost Analysis view to only show records with charges.
- Added functionality to flag documents for testing. This will create a document parameter named IsTesting on the flagged documents. This parameter can then be checked for either via integration or in custom code. This feature is available in a service's inbox and outbox and can be access via selecting one or more documents, clicking on **Actions** and then selecting **Flag selected documents for testing**.
- Add a diff viewer to the custom code control's history view. You can now compare code from the selected history record with your current code anywhere you can write custom code. To access this feature simply open your custom code, select the **History** tab, select a history record and click on **View Diff** in the command bar.
- Added additional details to grouped headers in the Transactions View.
- Added additional information to Excel exports from the Transactions View.
- MS Forms: Added a feature where at least 5 training documents need to exist before training is allowed from a workflow item.
- Major rework of the Transactions View and Transactions Audit View
- Added Tesseract OCR for on-the-fly OCR when drawing / manipulating labels on a document.
- Improved the conditional rules control in the Parameter Definition View to conform with the updated conditional rules in the AIForged platform.
- Improved UX by providing more useful feedback when certain views or controls are loading data.
- Reworked Teaching Tips for improved performance.
- New way to select items in a datagrid: Click and drag to select multiple items. This is great for selecting multiple documents, etc.
- It is now no longer necessary to manually rerun rules when publishing changes to a workflow item. Publishing will automatically rerun rules.
- Fixed an issue where copying labels to your clipboard from one project and pasting them in another project would not correctly identify existing parameter definitions in the target project.
- Fixed an issue that could cause labels to be duplicated under certain conditions during custom labelling.
- Fixed an issue with transferring custom amounts to users in the group management view.
- Fixed refresh login function not working when prompted to refresh your login session.
- Fixed an issue where a user could no longer edit their own profile
- Updated to WindowsAppSdk 1.3
- Performance Improvements
- Various bug fixes and other feature improvements

## UIPath Activities 1.5.1247.1318 (01-06-2023)

- Minor bug fix to initialize activity.

## AIForged Studio 1.4 (06-04-2023)

### Desktop
- The contents of the AIForged Studio window will now scale (up to a certain point) to fit the size of the user's desktop. This frees up a lot of screen real estate on devices with smaller or low resolution monitors.
- Users can now view and restore the settings history of any field definition in a service's "All Definitions" view. A new command button "View History" has been introduced for this.
- Users can now view and restore the settings / code history of any custom code. A new "History" tab has been added to the code editor. Please note that at this point in time, restoring code to a previous version will also restore other settings in the containing definition, such as replacement mappings and dictionary lookups.
- A new right-click context menu has been introduced to the document verification view. Right clicking on any blank space in a document will bring up a context menu with the same options available under the "More..." command button.
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
- Added a search component to the category selection control. This control is used to filter documents in the document view and to select a category during labelling.
- Removed the ability for users to register themselves. It is now necessary for AIForged consultants or partners to register new users.
- It is now possible to transfer custom bundle amounts between projects and services in the user group management screen.
- Added additional details in the transaction view to make it easier to identify services and nested services.
- Users can now restore deleted result documents from the inbox / outbox and wizard analysis / training / definition steps. A new command has been made available for this under the "Actions" menu or may simply be available from the command bar, depending on the view.
- Migrated to a unified codebase that allows us to compile and publish both our desktop and web versions of AIForged Studio with similar features between the two versions.
- Major performance improvements.
- Various bug fixes.

### WASM
A preview of the web version of AIForged Studio is available [here.](https://studio.aiforged.com/)

Please remember that this is a preview version and may not be stable and is still undergoing performance optimizations.

## UIPath Activities 1.5.1176.1128 (06-04-2023)

- Added export to CSV List activity. This activity allows your process to collect and export the extracted values for a given list of document Ids to a list of delimited strings.
- Added export to CSV file actvity. This activity allows your process to collect and export the extracted values for a given list of document Ids to a CSV text file.
- Added export to DataTable actvity. This activity allows your process to collect and export the extracted values for a given list of document Ids to a DataTable object.


