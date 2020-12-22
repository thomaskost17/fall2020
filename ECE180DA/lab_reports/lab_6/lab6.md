---
documentclass:
- article
geometry:
- top=1in
- left=1in
---
# ECE180DA : Lab 6 Report

$$\text{Thomas Kost}$$
$$UID:504989794$$

## Tasks Planned

- fine tuning and pull request of hand tracker
- gesture recognition (main focus)
    - make labeled data base for one gesure and garbage gestures
    - train classifier
    - create sliding window 
    - integrate blocks into gesture recognizer that can print out when gets gesture (can be replaced with triggering event)
- look into use of nerual nets for hand tracking (see if that is a more robust option)

## Tasks Completed
 - hand tracker fine tuned, validated in several different light scenarios and with several different backgrounds (some intentionally trying to confuse the algorithm)
    - item was pushed and merged
    - validation gives confidence in perfomace for location
    - number of fingers open seems to be an unstable calculation

 - mounting solution made for our raspberry pi and IMU
    - allows us to have consistent and robust readings
    - better track the position of the hand (aid our data base creation)
    - also looks pretty cool having a bunch of electronics strapped to your arm

- gesture recognizer progress
    - pushed code for the soft SVM classifier we validated on images
    - wrote script to record IMU readings and create a data base
        - soldered up leds with connectors to act as a indicator when making the database
        - learned GPIO manipulation 
    - wrote script to carry out the training on this database
    - currently making final database
- validation on all objects written thus far for midterm 
    - mqtt
    - hand tracker
    - gesture recognition algorithm
## Future direction
- finish database for gesture recognition
- testing for the gesture recognizer
- make sliding window object
- add event handling to the object so can interface