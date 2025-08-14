---
description: Overview of the AIForged activities in UiPath.
---

# UIPath Activities

Welcome to the AIForged UiPath Activities documentation. This comprehensive suite of activities is designed to integrate the robust capabilities of the AIForged platform into your UiPath workflows seamlessly. AIForged provides a wide array of AI-driven solutions for intelligent document processing, workflow automation, and data management. By leveraging these activities, you can augment your automation projects with advanced functionalities such as document processing, work item management, notifications, logging, dataset management, and much more.

### Key Features

* **Document Processing**: Automate document management with activities that support uploading, processing, and managing documents within your projects and services.
* **Work Item Management**: Streamline workflow processes with activities that facilitate the creation, escalation, transfer, and status updates of work items, enabling efficient task management and collaboration.
* **Notifications and Logging**: Stay informed with notification management activities and maintain comprehensive logs with logging activities, ensuring transparency and traceability in your automated processes.
* **Data and Configuration**: Retrieve system data types and configurations, manage datasets, and access parameter definitions to optimize your data-driven workflows.

### Getting Started

To begin using AIForged UiPath Activities, ensure you have initialized the AIForged API context in your UiPath project. This context acts as the bridge between your automation workflows and the AIForged platform, allowing you to securely access and manipulate resources.

### Supported Activities

#### Document Management

* **Upload Document**: Upload documents to specified projects and services.
* **Process Documents by Id**: Process documents using their unique identifiers.
* **Get Document Data**: Retrieve detailed data for specific documents.
* **Get Document**: Retrieve a document's information by its unique identifier.
* **Save Document Image**: Save a document image to a given filepath.
* **Delete Document**: Delete a document by its unique identifier.
* **Update Document Information**: Update a document's information.
* **Update Document Status**: Update a document's status.
* **Move Document**: Move a document to another service.
* **Copy Document**: Copy a document to another service.

#### Work Item Management

* **Create Work Item**: Initiate new work items for documents or shreds.
* **Escalate Work Item**: Escalate work items to different users or groups.
* **Transfer Work Item**: Transfer a work item to another user.
* **Update Work Item Status**: Modify the status of existing work items.
* **Get Work Item Count**: Get the number of work items based on various filters.
* **Get Work Items**: Retrieve work items belonging to the current user.
* **Create QA Work Items**: Create QA work items based on a provided ratio.

#### Notifications and Logging

* **Get Notifications**: Retrieve notifications based on various criteria.
* **Get Unread Notification Count**: Get the count of unread notifications.
* **Flag As Read**: Mark a notification as read.
* **Add Log Message**: Add entries to the logging subsystem for auditing and analysis.
* **Get Log Messages**: Retrieve a list of log messages based on filter criteria.

#### Data and Configuration

* **Get Data Types**: Access platform-specific data type information.
* **Get Enum Data**: Retrieve a collection of platform-specific enum data objects.
* **Get System Date**: Retrieve the platform's current system date and time.
* **Get Parameter Definition Hierarchy**: Retrieve the parameter definition hierarchy for a given project/service combination.
* **Get Parameter Definition**: Retrieve information about a parameter definition by its unique identifier.

#### Datasets

* **Create Dataset**: Create a new custom dataset in a project/service combination.
* **Delete Dataset**: Delete a dataset's content, and optionally its definition.
* **Get Dataset**: Retrieve a custom dataset and optionally its data.
* **Save Dataset**: Save changes to an existing custom dataset.
* **Synchronise Dataset**: Synchronize a system dataset with its project/service categories.
* **Create Dataset Record**: Create a dataset record.
* **Delete Dataset Record**: Delete a dataset record by its key Id.
* **Get Dataset Record**: Get a dataset record by its key Id.
* **Update Dataset Record**: Update a dataset record.

#### Project and Service Management

* **Get Project By Name**: Retrieve a project by its name.
* **Get Project By Id**: Retrieve a project by its unique identifier.
* **Get Projects**: Retrieve all projects for the currently authenticated user.
* **Get Project Categories**: Retrieve all categories for a given project.
* **Get Project Services**: Retrieve all services contained within a specified project.

#### Other Utilities

* **Initialize Connection Context**: Initialize an AIForged Connection Context object with your AIForged Username and Password.
* **Get Balance**: Get remaining credit balance per project/service.

### Considerations

While using AIForged UiPath Activities, keep in mind the following:

* **Permissions**: Ensure that the necessary permissions are configured for accessing and manipulating data within AIForged.
* **Error Handling**: Implement robust error handling to manage potential issues, such as network connectivity problems or invalid input data.
* **Performance**: Optimize activity configurations to maintain efficient performance, especially when dealing with large datasets or multiple work items.

By integrating AIForged UiPath Activities into your automation workflows, you can harness the full potential of AI-driven document processing and workflow automation, driving enhanced productivity and operational efficiency.

### Minimum Requirements

To successfully use the _AIForged_ activities in _UiPath Studio,_ the minimum license requirements of your studio should be version 2023.4.8.

### Package Name

The name of the package is: **AIForged** by **AIForged**

![](../assets/image%20%281%29%20%281%29%20%282%29%20%282%29.png)
 IgnoreCase Multiline IgnoreCase Multiline

