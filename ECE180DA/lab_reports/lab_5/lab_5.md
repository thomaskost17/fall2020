---
documentclass:
- article
geometry:
- top=1in
- left=1in
---

# ECE180DA : Lab 4 Report

 Thomas Kost |  UID:504989794

## Tasks Planned
 - Complete implementation of hand tracker object
 - write general script for trainin classifiers
 - some code integration

 ## Tasks completed

 - Hand tracker completed
    - uses OpenCV to mask out skin toned pixels and blur the image to reduce noise and make our system more tuned for close objects (a hand should be close for our application)
    - gets convex hull and finds acute defects in the hull to determine if fingers present
    - determines location based on center of mass of acute defects
    - allows for arbitrary digital filtering of the locations from frame to frame 
- General script for training using CVXpy written. allows for formulating of some optimization problem that can be optimized to find a seperating hyperplane for any labeled set of data
    - intended for use in gesture recognition
    - soft SVM is current implemented optimization problem
- code structure discussed and implemented
- Midterm report fine tuned

## Future Direction

- fine tuning and pull request of hand tracker
- gesture recognition (main focus)
    - make labeled data base for one gesure and garbage gestures
    - train classifier
    - create sliding window 
    - integrate blocks into gesture recognizer that can print out when gets gesture (can be replaced with triggering event)
- look into use of nerual nets for hand tracking (see if that is a more robust option)