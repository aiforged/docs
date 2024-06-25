# 📏 Managing Roles in Groups

### Overview

Roles in AIForged are specific sets of permissions and responsibilities assigned to users within a project. Each role is linked to a single project and can have an optional validity date.

## Managing Roles

#### User Permissions outline

There are many types of permissions and roles that a user can have. Here is an outline of each role

{% hint style="info" %}
The roles and behavior can be customized with custom logic&#x20;
{% endhint %}

{% hint style="info" %}
A user can have multiple roles assigned to them
{% endhint %}

* **Owner**: This role has full, unrestricted access to the project, including all service configurations and documents.
* **Administrator**: This role has access to manage and shape the project.
* **Verify-**: This role provides users with access to Human In The Loop (HITL) to manage exceptions and business rules.
* **Layout-**: This role allows users to access the wizard and train documents.
* **View-**: This role grants viewing rights only, allowing the user to see the project without editing any documents.

### Creating a Role

Creating a role in AIForged is a straightforward process:

1. **Navigate to Usergroups**: Access the Usergroups section in AIForged.
2. **Select the Group**: Choose the group where you want to create the role.
3. **Initiate Role Creation**: Click on "Create Role" to begin the role creation process.
4. **Specify Role Details**:
   * **Project**: Select the project to which the role will be linked.
   * **Name**: Provide a name for the role.
   * **Group Type:** Select the Role (see[ User Permissions outline](managing-roles-in-groups.md#user-permissions-outline))
   * **Validity Date**: Optionally, set the start and end dates for the role's validity.

<figure><img src="../.gitbook/assets/image (3) (1).png" alt=""><figcaption></figcaption></figure>

5. **Confirm Role Creation**: Complete the process to create the role.

### Deleting a Role

To delete an existing role, follow these steps:

1. **See More Options**: Click on the "More options" button for the role you wish to delete.
2. **Select Delete**: Choose the delete option to permanently remove the role from the system.

<figure><img src="../.gitbook/assets/image (5).png" alt=""><figcaption></figcaption></figure>
