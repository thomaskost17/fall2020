---
documentclass:
- article
geometry:
- top=1in
- left=1in
---

# ECE180DA : Lab 2 Report

$$\text{Thomas Kost}$$
$$UID:504989794$$

## Tasks Planned

 - Complete Project Proposal
 - Github Setup
    - Simple CI/CD automations (doesnt have to do much for now)
    - Kanban Board and workflow specification
    - Clang format and clang-tidy for any C/C++/CUDA to be written
    - Start format for Wiki
    - Rough File Structure
- Week 3 Tutorial
- Finish wireless of Week 2 Tutorial


## Tasks Completed

- Project proposal and rough timeline was completed and turned in
- Github was setup with proper project board and some simple automations for code linting and code compiling (all sub-tasks listed above were completed)
- Week 3 Tutorial
    - Completed the server-client model script. This was done locally on my windows device through WSL. The code as described did not function properly with python3. As a result I had to modify both the port number and the strings passed through the port. This was accomplished through using the `.decode()` and `.endoce()` functions.
    - Completed the MQTT publisher and subscriber exercise. I managed to get the publisher and subscriber running on a terminal SSHed into my raspberry pi and on my local windows terminal. This allowed me to communicate between the two devices via MQTT. 
    - Modified the publisher script to send a variety of data. Could be useful to send JSON files containing a sender ID and Reciever ID to communicate between devices. 
- week 2 Tutorial completed as Pi zero W has arrived.
    - completed the tasks and connected to my local wifi. This was a little difficult as I did not realize the pi cannot interface with 5G wifi. This was resolved by using the 2G band. 
    - Tested using my camera with the pi, took an image and pushed it to the github
    - installed berryconda and all related software necessary to complete the tasks
    - still running into an issue with the `cv2.closeAllWindows()` function
## Future Direction

- Explore hand tracking with OpenCV
- reassess speed running on piZero with OpenCV and python
- Complete Week 4
- consider applications of MQTT or a server client model for adding texting to someones AR vision (could be a simpler project that would start us out for the library and have a focus on communication)