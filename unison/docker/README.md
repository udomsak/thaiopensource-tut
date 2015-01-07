การติดตั้ง แอพพลิเคชั่นพื้นฐาน 
=======

- apt-get install python-setuptools
- easy_install pip 
- pip install fig 

การติดตั้ง
=======

git clone https://github.com/udomsak/thaiopensource-tut.git
cd thaiopensource-tut/unison

fig up -d central

ทดสอบ
=====

docker exec -it { container-id} /bin/bash

central#  ping node2
central#  ping central
central#  ping node3

