---
documentclass:
- article
geometry:
- top=1in
- left=1in
---

# ECE180DA : Lab 3 Report

 Thomas Kost |  UID:504989794

## Tasks Planned

- Week 4 Tutorial
- MQTT Backend Wrapper and infrasturcture for sending multitude of messages
- Look into hand recognition for image processing

## Tasks completed
- Week 4 tutorial was completed to best of ability for the time being
    - while my IMU arrived, no cables came with it, and I somehow did not have any female to female dupont wires. As a result I was not able to set up the IMU this week.
    - Focused on the speech processing part. Got a conda environemnt set up to run both the Python Libary of Speech Processing and pocketsphynx. One difficulty I ran into when doing this was that I initially set up my environement within my WSL file structure. This became problematic as WSL does not have access to the builtin microphone on the laptop. Unfortunately, none of the work  arounds I found fixed the issue, so I had to re-setup the environemnt on windows.
    - Ran through simple script to listen and print out the results--if you anunciate it works really well (and doesn't require lots of in depth coding) 
- Completed and unit tested MQTT backend setup to allow for sending of json data packets with easy user interface
    - JSON schema was also made to allow us to validate messages against a predetmined format
    - allows for input and output to the interface to be a python dictionary, so no string manipulation required
    - general Link object that can be configured as RX/TX
    - supports variable listening times
    - pull request made, currently in review
- Looks like certianly doable with OpenCV. 
 - general process seems to be getting a mask to get the contour and finding defects of a certain external angle in the convex hull. This can be done to detect fingers and track a hand. 
 - logic could be added to further recognize a closed hand or count the number of fingers that are being shown (used for applications like visual hotkeys) 

 ## Future Direction
 - Try to track hand with OpenCV and return a position
 - complete the IMU tutorial (dupont wires should be here saturday)
 - Work on either a module to overlay an image onto another or a hand tracker (shoot for a pull request by end of sprint) 
