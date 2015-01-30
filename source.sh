#!/bin/bash
cd $(dirname $0)
curl -o dic.txt http://imas-db.jp/misc/dic.txt
ruby -e 'puts ARGF.read.encode("utf-8", "cp932")' < dic.txt > dic.utf8
