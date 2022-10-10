---
description: AIForged. Project.GetProjectById

title: Initialize1
parent: UIPath Project
grand_parent: UIPath Activities
nav_order: 1
---

# Get Project By Id

## About

The **Get Project** activity allows you to get a project from AIForged using the project Id. When a project is created in AIForged, the project is assigned a static project Id.

### Display Name

Get Project By Id

### Input

**Context** - Requires a context for the connection to AIForged. Includes connection configuration information, user information and authentication information. This is a regular VB or C# expression.

**ProjectId** - This is the **Id** that was given to project when the project was created in AIForged. You can view the project Id in AIForged by hovering you mouse anywhere over the project name.

<figure><img src="../../.gitbook/assets/image (11).png" alt=""><figcaption><p>View Of Project Id In <strong>AIForged</strong></p></figcaption></figure>

### Misc

**Private** - If not selected, the values of variables and arguments are at Verbose level.&#x20;

**Result** - Returns AIForged.API.ProjectViewModel

## Activity Preview

### Activity View

<figure><img src="../../.gitbook/assets/image (9).png" alt=""><figcaption><p>Get Project By Id Activity</p></figcaption></figure>

### Activity Property View

<figure><img src="../../.gitbook/assets/image (10).png" alt=""><figcaption><p>Get Project By Id Activity Properties</p></figcaption></figure>
