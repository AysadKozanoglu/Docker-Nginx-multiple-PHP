

###  Docker fabrication for  nginx with multiple php ###

Quick launch

<pre>
docker pull aysadk/nginx-multiple-php
docker run -p 8881:8881 -p 8891:8891 --rm -P nginx-multiphp-byaysad
</pre>

nginx +  php versions 7.1 & 5.6

exposed ports are 8881 8891

after fabricated with docker you will able to access both versions in different ports simultanously

php7.1 on port 8891
php5.6 on port 8881

## Docker Fabrication launch##
<pre>
git clone https://github.com/AysadKozanoglu/Docker-Nginx-multiple-PHP.git 

docker build -t nginx-multiphp-byaysad Docker-Nginx-multiple-PHP

docker run -p 8881:8881 -p 8891:8891 --rm -P nginx-multiphp-byaysad
</pre>



MIT License

Copyright (c) 2018 Aysad Kozanoglu


Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
