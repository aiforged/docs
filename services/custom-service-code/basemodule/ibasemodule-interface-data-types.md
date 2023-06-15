---
title: Custom Code - Data Types
parent: Custom Service Code
grand_parent: Understanding Services
nav_order: 2
---

# IBaseModule Interface Data Types

The **IBaseModule** interface exposes object data types that can be used in the **Custom Service Code**. The object data types are shown in the following table.

| Data type                | Description                                                                                            |
| ------------------------ | ------------------------------------------------------------------------------------------------------ |
| **IApplicationUser**     | An AIForged user.                                                                                      |
| **IClasses**             | Category of a document.                                                                                |
| **ICustomDataSet**       | A data set table, a collection of data.                                                                |
| **ICustomDataSetRecord** | A record in a Custom Data Set.                                                                         |
| **ICustomDataSetValue**  | A cell value in a record of a Custom Data Set.                                                         |
| **IDocument**            | A document object.                                                                                     |
| **IDocumentData**        | An object containing metadata of a document object.                                                    |
| **IDocumentParameter**   | A parameter in a document. Can only have one Parameter Definition, but can have multiple Verifications |
| **IParameterDef**        | A parameter definition object.                                                                         |
| **IProject**             | An AIForged project.                                                                                   |
| **IProjectUser**         | An AIForged user object linked to a project with Roles and Permissions.                                |
| **IVerification**        | A verification object containing OCR data and location in a document.                                  |
| **IWorkItem**            | A work item object that requires human-in-the-loop attention.                                          |

## Enums
