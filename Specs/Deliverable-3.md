# Deliverable 3

> Each deliverable part is cumulative, building on previous deliverable parts of the solution. For each deliverable, any and all supporting functionality of previous deliverables must function correctly in order to gain marks for the demonstrated deliverable.
>
> Your instructor is free to make changes and/or additions to this lab and its marking guide(s). ***You*** are responsible to make sure that you are up-to-date with all the changes/additions made by your instructor.

## Query – ObjectDataSource Search & Display with a GridView

This form is similar to the concepts demonstrated in the Data Bound Controls topic and exercise. In this form, the student must use a GridView to display multiple rows of data. All fields of the displayed entity must be used, unless otherwise specified in your scenario. The GridView must implement paging, with the page size being set to between 10 and 25 rows per page (as appropriate for your scenario).

For the GridView control, all foreign key information must be displayed/editiable via a DropDownList that displays appropriate information to the user while representing the value for the foreign key.

The controls in this form **must** be populated using ObjectDataSource controls only (no code-behind can be used to populate the forms).

BLL methods used by this form **must** be exposed for discovery to the Object Data Source: Configure Data Source wizard.

----

## Marking Guide/Checklist - *5%* – Scenario Number: ________

This portion of the lab consists of the functioning Query and the related BLL components.

* Lab Documentation (Web Form)
  - [ ] List of known bugs & incomplete portions of lab
* Project Architecture & Code Quality
  - [ ] Proper & consistent use of exceptions and exception handling
  - [ ] Separate BLL classes coded for all the required tables
  - [ ] BLL classes and methods use correct annotations
* Query – GridView Lookup using ObjectDataSource (must not use code-behind to populate controls)
  - [ ] Form correctly applies an appropriate search technique (use of filter where requested)
  - [ ] Form correctly performs Lookup and binds data to a GridView control
  - [ ] Form uses DataSource control(s) to supply data to the GridView
  - [ ] GridView control uses column headers with meaningful names (not auto-generated)
  - [ ] GridView control uses appropriate alignment and formating for displayed data
  - [ ] GridView correctly displays data in the form
  - [ ] GridView control has paging implemented
  - [ ] GridView control uses template columns with DropDownList control where appropriate
