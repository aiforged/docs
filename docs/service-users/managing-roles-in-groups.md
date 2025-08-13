# 📏 Managing Roles within Usergroups

Effectively managing roles ensures that users have the appropriate access and responsibilities within your agents. In AIForged, roles are flexible and can be tailored to match your organization’s unique requirements. See [.](./ "mention") for a further overview of this functionality in AIForged.

***

### Understanding Roles and Permissions

AIForged supports multiple roles, each granting specific permissions within a project or group. Users can be assigned one or more roles, and custom logic can be applied to further refine their behavior.

**Common Roles**

| **Owner**         | Full, unrestricted access to the agent, including all service configurations and documents.       |
| ----------------- | ------------------------------------------------------------------------------------------------- |
| **Administrator** | Authority to manage and configure the agent, including user management and agent settings.        |
| **Developer**     | Ability to create, modify, and test AI agents and services within the agent.                      |
| **Verify**        | Access to Human In The Loop (HITL) features to manage exceptions and validate business rules.     |
| **Layout**        | Permission to use the document wizard and train documents, enhancing AI learning and performance. |
| **View**          | Read-only access, allowing the user to see agent details without making any changes or edits.     |

> **Tip:**\
> You can assign multiple roles to a single user to combine permissions as needed.

***

### Creating a Role

Follow these steps to create a new role within a Usergroup:

1.  **Navigate to Organisations**\
    Go to the Organisations section in AIForged.\


    <div align="left"><figure><img src="../assets/image (89).png" alt=""><figcaption></figcaption></figure></div>
2.  **Select the Relevant Group**\
    Choose the Usergroup where you wish to add a new role. Click on its name to open its management view.\


    <div align="left"><figure><img src="../assets/image (90).png" alt=""><figcaption></figcaption></figure></div>
3.  **Initiate Role Creation**\
    Click on the **Create Role** ![](<(../assets/image (91).png>) button to start defining a new role.\


    <figure><img src="../assets/image (92).png" alt=""><figcaption></figcaption></figure>
4.  **Fill in Role Details**

    1. **Role Name**\
       Enter a clear and descriptive name for the role.
    2. **Select Permissions**\
       Choose the appropriate role permissions from the available permission options.
    3.  **Link Agent (Optional)**\
        Select the agent this role will be associated with.

        > _Tip:_ Leaving this blank means this role’s permissions will apply implicitly to any other roles in the group that have an agent explicitly linked to them.
    4. **Members (Optional)**\
       Start inviting members or create new users directly from the role management dialog!

    <div align="left"><figure><img src="../assets/image (94).png" alt=""><figcaption></figcaption></figure></div>
5. **Confirm and Save**\
   Review the details and complete the process to create your new role.

***

### Deleting a Role

To remove a role from a Usergroup, follow these steps:

1.  **Access More Options**\
    Locate the role you wish to delete and click the **More options** action.\


    <figure><img src="../assets/image (95).png" alt=""><figcaption></figcaption></figure>
2.  **Select Delete**\
    Click on the **Delete** option.

    <div align="left"><figure><img src="../assets/image (96).png" alt=""><figcaption></figcaption></figure></div>


3.  **Confirm Deletion**\
    If you are sure you want to delete the user role, then click on **Yes**, otherwise click **No**

    <figure><img src="../assets/image (97).png" alt=""><figcaption></figcaption></figure>


