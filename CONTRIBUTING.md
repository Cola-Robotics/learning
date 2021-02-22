~~~~~DOCKER~~~~

Follow these instructions to install Docker
https://docs.docker.com/engine/install/ubuntu/

First, download the Dockerfile. 
Navigate to the folder where the Dockerfile is.
Now build the dockerfile into an image
$ sudo docker build -t colaimage:latest .

Start a container from the image named cola and attach a volume to it
$ sudo docker run --name cola-cont -v cola:/cola -it colaimage
see https://docs.docker.com/storage/volumes/#start-a-container-with-a-volume
for details

If you encounter GUI issues within container, try adding "--net=host and --privileged" to docker run
e.g. sudo docker run --name cola-cont -v cola:/cola -it --net=host --privileged colaimage

To exit the container, run
$ exit
from within the container

If you try to reconnect to the container, you may get an erro saying it is already running.
Use
$ docker start cola-cont
To start the container and
$ docker attach cola-cont
to reattach to the container.

Alternatively, you can remove it with
$ docker rm cola-cont


To learn about networking, see
https://docs.docker.com/network/network-tutorial-standalone/

All development is expected to happen inside of a container


~~~~~Travis CI~~~~~

TODO Calen fill this in


~~~~~COMMITIZEN~~~~~

In order to facilitate better commit messages, use commitizen.
Instead of using "git commit", use "git cz"

Commitizen is already installed in the container


~~~~~TMUX~~~~~~

To run multiple processes in the container, use tmux.
This is a good article to get familier with it: https://leimao.github.io/blog/Tmux-Tutorial/
Here is a good quick reference: https://tmuxcheatsheet.com/
Here is the man page: https://man7.org/linux/man-pages/man1/tmux.1.html

TMUX is already installed in the container

~~~~~DOXYGEN~~~~~

Doxygen is used to document our code.

To install Doxygen:
run: sudo apt install doxygen

To install rosdoc_lite (ROS package to make Doxygen documentation easier):
run: sudo apt-get install ros-noetic-rosdoc-lite

To add documentation to a ROS package:
run: rosdoc_lite [package path]
     (will generate /doc folder)

To view documentation:
run /doc/html/index.html in browser, e.g.: firefox ./doc/html/index.html

(Note: access most info through "Files" drop-down on top of page)

More info: http://wiki.ros.org/rosdoc_lite 


~~~~~JIRA~~~~~

You can add a comment to a jira issue via a git commit. In cz, you can add this in the long description.
Here is the reference page: https://confluence.atlassian.com/fisheye/using-smart-commits-960155400.html

Some examples
JRA-34 #comment corrected indent issue
JRA-090 #close Fixed this today
JRA-34 #time 1w 2d 4h 30m

~~~~~STYLE GUIDE~~~~~

In general you should follow the google style guides. You can find the C++ and python guides here
https://google.github.io/styleguide/cppguide.html
https://google.github.io/styleguide/pyguide.html

Note that pylint is installed in the docker container
