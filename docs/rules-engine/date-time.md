# Date / Time

The **Date/Time Rule Type** can be applied on extracted data where a date and/or time is expected.

![](../assets/image%20%28116%29.png)
The output format of the **Date/Time Rule Type** can be set by defining the locale and country. Other parsing formats can also be added by clicking on "_Click here to add a new row_".

![](../assets/image%20%2888%29%20%282%29.png)
Matching patterns for **Date** and **Time** can be specified in a list. The **Date/Time Rule Type** will run iterate through all the format entries in the list and try to match one to the data that was extracted. If a pattern was matched, the **DateTime** object can be build by correctly identifying the day (dd), month (MM), year (yyyy) components for **Date**, and hour (HH), minute (mm) and second (ss) compinents for **Time**. Additional formats can be added for both **Date** and **Time** by clicking on "_Click here to add a new row_".

![](../assets/image%20%28115%29.png)


