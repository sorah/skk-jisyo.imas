# SKK dictionary for IDOLM@STER

Scripts to generate SKK dictionary contains words, names around IDOLM@STER world.

Basically entries come from [THE IDOLM@STER データベース](http://imas-db.jp/) [IMEユーザー辞書登録用テキスト](https://github.com/maruamyu/imas-ime-dic).
Plus, entries for given name and family name of people and characters around the IDOLM@STER world (this is not included in imas-db.jp's dictionary, see ./names.txt)

## To generate

```
./source.sh
ruby generate.sh > skk-jisyo.imas
```

### Generated files
- [skk-jisyo.imas](./skk-jisyo.imas)
- [skk-jisyo.imas with BOM](./skk-jisyo.imas.bom)

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
The MIT License (MIT)
