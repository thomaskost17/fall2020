---
documentclass:
- article
geometry:
- top=1in
- left=1in
---
# ECE180DA : Lab 8 Report

Thomas Kost
UID:504989794

## Tasks Planned
- finish database for gesture recognition
- make sliding window object
- add event handling to the object so can interface
- Train classifier
- Validate calssifier

## Tasks Completed
- Some further degubbging on the database creation script (issues with the GPIO pins). Additionally, noted some extreme delays in ssh speed (raspberry pi would take extremely long to perform pip installs, leading to some delay in actualy being able to genrate the environment needed to run the script)
- ran database generation script
- Generated 800 sample labeled training data base, denoting between 'garbage' gestures and a 'left swipe' gesture. Also generated seperate database for testing data (another 200 labeled instances)
- completed training script (executes running of the soft SVM) so preliminary classification has been completed. Currently, checking on the resulting accuracy and performing validation.
- added to database for flat surface segmentation to train our nerual network to identify flat surfaces in the envrionemnt
- skeleton code for sliding window object, needs validation but general structure is there
- wrote classifier object to read in pre trained coefficeints and classifiy an event
    - unit tested
## Future Tasks
- Finish Validating calssifier (in progress)
- final ingration of classifier
- unit test sliding window object
- investigate removing sampling time jitter from raspberry pis (there seems to be a difficulty in doing so as the pi's os can suddenly deem some operation more important than my code, so might have to be something we live with)
    - if possible add interrupt based sampling to the sliding window

