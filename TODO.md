# TODO Items

We are implementing a simple author inquiry system for authors to view the status of their submitted manuscripts.

Please note, the ```/admin``` namespace is just there to verify basic sanity and is not where your code should go. The features you are adding are intended to be used by authors wanting to view the status of their papers.

## Instructions

* First, there are some existing specs that have been intentionally left incomplete/failing/pending. Fix them.
* Implement the status inquiry feature (see below) with specs.

--------------------------- 

### Status inquiry feature

Fix the `View the status of your paper here` link on the welcome page so that when clicked,
the author sees a form that allows him/her to input a code and a last name.
When submitted, if the name matches an "acceptable" (rules below) author on the specified manuscript, 
they should be shown a page that displays the title, status, and authors of that manuscript. 
If the inputs are invalid, the form page should be re-rendered (inputs intact)
with a "No match" message.

The project already includes ```Manuscript``` and ```Author``` models.
Use ```Manuscript.find_by(last_name: "x")``` and ```Author#last_name``` 
to implement the above.

* The specified author name must match the last name of one of the first 3 authors on the specified manuscript to be accepted.
* Name matching specifications/rules:
  * ignore surrounding whitespace and case
  * accept match on first 3 chars (e.g. Jon for Jones)
  * reject match on less than 3 chars (e.g. Jo for Jones)
  * accept exact match for 2 char author name (e.g. Li for Li)
  * reject exact match on 1 char author name
  * reject mismatch on chars beyond 3 (e.g. reject Jonis for Jones)

------------------------------

## Additional Tasks

* Integrate [Normalize.css](https://necolas.github.io/normalize.css/) and put in
  some basic styling on the manuscript display page. (No need to go crazy, just 
  enough to demonstrate how you would add styling to specific page elements.)
* Implement a way to inject custom page titles from view templates and integrate it 
  in the manuscript display page and admin/manuscripts/show.
* Upgrade to Rspec 3
* Introduce a Docker/docker-compose such that a developer can start the development 
  stack (e.g. Mongo) without having it installed directly.
