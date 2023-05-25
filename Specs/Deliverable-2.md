# Deliverable 2 - Project Setup


> Each deliverable part is cumulative, building on previous deliverable parts of the solution. For each deliverable, any and all supporting functionality of previous deliverables must function correctly in order to gain marks for the demonstrated deliverable.
>
> Your instructor is free to make changes and/or additions to this lab and its marking guide(s). ***You*** are responsible to make sure that you are up-to-date with all the changes/additions made by your instructor.

## The Visual Studio Solution

Your solution must be a client-server solution consisting of multiple projects as outlined in the course. The Presentation Layer portion is to be an ASP.NET web application (.NET Framework). The BLL, Entity classes and DAL portions of the system are to be placed in a separate class library project.

## The StarTED Database

The database supplied for this lab is an SQL Server database named "StarTED". The following is a sample of the connection string that may be used for the Presentation Layer.

```xml
  <connectionStrings>
    <add name="StarTEDDb"
         connectionString="Data Source=.;Initial Catalog=StarTED;Integrated Security=True;"
         providerName="System.Data.SqlClient" />
  </connectionStrings>
```

## The Forms

There are two web forms for the core functionality of this project (described below). You must name the forms `Query.aspx` and `CRUD.aspx`. In addition, you must edit the `Default.aspx` web form at the root of your web application. All of these forms must share the same Master Page, which must provide navigation among all the pages in your web application.

### Master Page

Your master page must contain the following elements:

* Site Navigation – Links to all the pages in the web application (use the Menu control).
* Scenario Title – The number and name of the scenario (e.g.: G1 – Reservations by Group).
* Student Name – Your first and last name.

### Default Page

Your default (home) page must contain the following elements (each with their own heading):

* **Form Description** – A brief description of each form in the solution, identifying the name of the form and its purpose, along with any unique constraints or characteristics of the form's behaviour.
* **Known Bugs** – A bulleted list of all the known bugs and incomplete portions of the lab.
* **Entity Relationship Diagram** - The ERD diagram (from the lab selection) of your specific scenario.

----

## Marking Guide/Checklist - *5%* – Scenario Number: ________

This portion of the lab consists of the structured solution, documentation, and functioning code for required entities and DAL layer.

- Project Architecture & Code Quality
  - [ ] Client-Server architecture (multiple projects inside a single solution)
  - [ ] Master Page with functioning site-master based navigation, Scenario Title and student's name
  - [ ] Appropriate Entity CRUD class
  - [ ] Requested annotation for Entity CRUD class (Table, Key, NotMapped, DatabaseGeneration)
  - [ ] Appropriate validation annotation for Entity CRUD class (Required, StringLength)
  - [ ] Appropriate Entity support classes (if required for your scenario)
  - [ ] Requested annotation for Entity support classes (Table, Key, NotMapped, DatabaseGeneration)
  - [ ] DAL class with appropriate code for all the required tables
- Configuration
  - [ ] Proper references have been setup between projects.
  - [ ] web.config file has the correct entry for connection strings
  - [ ] DAL class sets database intiializer to null (preventing automatic table creation by EntityFramework).
  - [ ] Your DbContext class references proper connection string.
- Lab Documentation (Web Form)
  - [ ] Requested Lab documentation placed as the home page for the web application (Default.aspx)
  - [ ] List of known bugs & incomplete portions of lab
  - [ ] Entity Relationship Diagram of selected scenario
- CRUD – Single Item CRUD
  - [ ] Blank form with title of selected option in the student's scenario and page banner title.
  - [ ] Content page Title set to CRUD - StarTED
- Query – GridView
  - [ ] Blank form with title of selected option in the student's scenario and page banner title.
  - [ ] Content page Title set to ODS - StarTED
- Site.master
  - [ ] Menu with working links to the Home and CRUD/Query pages
  - [ ] Your name in the menu brand portion of the site navigation
