#!/bin/bash
cd $(dirname $0)
git clone git@github.com:maruamyu/imas-ime-dic.git
cp imas-ime-dic/dic.txt .
