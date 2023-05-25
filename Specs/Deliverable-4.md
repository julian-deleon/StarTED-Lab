# Deliverable 4

> Each deliverable part is cumulative, building on previous deliverable parts of the solution. For each deliverable, any and all supporting functionality of previous deliverables must function correctly in order to gain marks for the demonstrated deliverable.
>
> Your instructor is free to make changes and/or additions to this lab and its marking guide(s). ***You*** are responsible to make sure that you are up-to-date with all the changes/additions made by your instructor.

## CRUD – Single Item CRUD

This form is similar to the cumulative results of concepts demonstrated in the Data Access CRUD topics and exercises. In this form, the student must provide a means to

* Lookup and display a single row of data from a table
* Insert new rows of data into a table
* Update an existing row of data in a table
* Delete (or mark as inactive/not current) a row of data in a table

#### Handling Large Data Sets

For most of the scenarios, you will need to perform your look up in two steps. The reason for this is because there are far too many rows of data to put in a single drop-down list. For example, with thousands of *Students* in the database, it is impractical to fill a drop-down and expect a user to find the student they wish to edit. In these situations, a two-step selection process makes the form more managable by the user. The filter search sql procedures have been written to produce an error if too many records would be returned.

1. First, gather user input to send to the supplied stored procedure so as to produce a "short-list" of items to select from. You can display this short list in either a `DropDownList`, `GridView` or `RadioButtonList` control.
2. The second step is where the user can select a single item in the short list to edit.

Also note that many of the scenarios will require you to have this two-stage selection process not only for choosing the row of data to edit, but also for selecting a related item as the foreign-key reference for the entity you are editing.

#### Other Considerations

Depending on the scenario and the table, the Delete functionality may not be a physical removal of a row of data. This is because some tables have triggers or other constraints that prevent the removal of existing rows. In these cases where a row cannot be deleted (excluding foreign key constraints preventing removal), the table will have some means of flagging the row as being inactive or not current.

For example, in the Employee table, a foreign key constraint prevents any rows from being deleted. However, that table has a nullable column called "ReleaseDate" which can be set to indicate that the person is not currently employed. For advice on how to deal with these situations, please consult your instructor.

----

## Marking Guide/Checklist - *20%* – Scenario Number: ________

This portion of the lab consists of a functioning CRUD, demonstrating Single Item CRUD supported by code-behind on the form and the BLL.

* Lab Documentation (Web Form)
  - [ ] List of known bugs & incomplete portions of lab
* Project Architecture & Code Quality
  - [ ] Proper & consistent use of exceptions and exception handling
  - [ ] Separate BLL classes coded for all the required tables
  - [ ] BLL method(s) required for all form queries
  - [ ] BLL method required for Add
  - [ ] BLL method required for Update
  - [ ] BLL method(s) required for Delete
* Form A – Single Item CRUD
  - [ ] Form correctly populates DropDownList controls on Page_Load event
  - [ ] Form correctly applies a UI for the appropriate search technique (use of filter where requested)
  - [ ] Form correctly uses stored procedures for the appropriate search technique (use of filter where requested)
  - [ ] Form correctly uses the appropriate search techniques/filters to Foreign Key references (where applicable)
  - [ ] Form correctly looks up and displays a single item
  - [ ] Form demonstrations use of DataSource controls and code-behind to fill/populate data-bound controls
  - [ ] Form uses disabled (non-editable) controls for all data that is not related to Add/Update functionality
  - [ ] Form correctly uses Validation controls for client-side validation of Add/Update functionality
  - [ ] Form correctly uses Validation controls for server-side validation of Add/Update functionality
  - [ ] Form correctly adds data to a database
  - [ ] Form correctly gives up-to-date feedback on whether the add was successful or not
  - [ ] Form correctly refreshes the web page display whether the add was successful or not
  - [ ] Form correctly updates data in the database
  - [ ] Form correctly gives up-to-date feedback on whether the update was successful or not
  - [ ] Form correctly refreshes the web page display whether the update was successful or not
  - [ ] Form correctly performs Delete of data (or equivalent) in the database
  - [ ] Form correctly gives up-to-date feedback on whether the attempted delete (as applicable) is successful
  - [ ] Form correctly refreshes the web page display whether the delete was successful or not
  - [ ] Messages correctly identifies items on the web page.
