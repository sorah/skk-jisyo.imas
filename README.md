# SKK dictionary for IDOLM@STER

Scripts to generate SKK dictionary contains words, names around IDOLM@STER world.

Basically entries come from [THE IDOLM@STER データベース](http://imas-db.jp/) IMEユーザー辞書登録用テキスト.
Plus, entries for given name and family name of people and characters around the IDOLM@STER world (this is not included in imas-db.jp's dictionary, see ./names.txt)

## To generate

```
./source.sh
ruby generate.sh > skk-jisyo.imas
```

## Thanks

Most of this dictionary generated based on [THE IDOLM@STER データベース](http://imas-db.jp/) IMEユーザー辞書登録用テキスト.

## For maintainers

This is necessary to split given name and family name.

Requirements: Ruby 2.0.0+

### Download source

```
./source.sh
```

this will download `dic.txt` from http://imas-db.jp/misc/dic.txt, then save utf-8 version to `dic.utf8`.

### Prepare working file for name dictionary

```
ruby people_prep.rb > names.working.txt
```

then edit `names.working.txt`.

### Commit edited names.working.txt to names dictionary

Confirm your change:

```
ruby people_format_patch.rb
```

append it:

```
ruby people_format_patch.rb >> names.txt
```

clean names.txt:

```
ruby people_clean.rb
ruby people_clean.rb --apply
```

## License

### This work

```
The MIT License (MIT)

Copyright (c) 2015 Shota Fukumori (sora_h)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.```

### Original work (dic.txt)

MIT License: http://twitter.com/mirai_iro/status/561388383918780416

```
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

