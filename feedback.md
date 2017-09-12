# Project 2 Evaluation

## Technical Requirements
**2: Performing**
>The app contains 2 models, with at least 1 association. At least 1 model is full CRUD.

## Creativity and Interface
**1: Progressing**
>The app is styled and has an interface of value to the end user: it is not just a nav bar and an index page

## Code Quality
**1: Progressing**
>Code lacks proper formatting, includes commented out, non-functional code, or otherwise contains major issues of quality (DRY, naming, etc)

## Deployment and Functionality
**2: Performing**
>Application contains no major errors, is deployed correctly, and contains a custom Heroku app name appropriate for the app.

## Planning / Process / Submission
**0: Incomplete**
>No submission received, or submission does not contain basic documentation of planning (ERD, wireframes, commit history, etc)


## Notes

You put together an interesting app here. I like the concept and would love to see it fleshed out more.

**Of major concern** is the lack of planning information as outlined in the [Project2 Deliverables](https://github.com/ga-wdi-exercises/project2#deliverables). There was no `planning` folder and your `README.md` hasn't been updated to include details about this project. A zero score in any of the evaluation topics for a project will disqualify you from graduation/outcomes. In order to rectify this, planning information (readme and planning folder with documents) needs to be added to the repo before the end of the 12th week.

I discovered one bug in the app that may have been hidden from you during your testing. In the skills show view, (ex `https://codeskillswap.herokuapp.com/skills/1`) you display the user's proficiency or interest if one exists. However instead of retrieving by the `current_user`, the proficiency/interest was taken from the `.first` item inside the `@skill` object, which is not guaranteed to belong to the `current_user`. Please see notes in `app/views/skills/show.html.erb` for more information about how this can be avoided.

Consider taking more advantage of feature branches while developing your projects. There was quite a bit of extraneous or unneeded code in the submitted project. For instance the SkillsController and UsersController had several methods/actions which were completely unreachable based on the available routes in `config/routes.rb`. There was also a completely empty model file, `comment.rb` included. This can be avoided by being more meticulous and focused about which goals you're trying to achieve at a time, and avoid jumping around between multiple discrete features.