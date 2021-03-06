#!/bin/bash
for f in plugins/Agregator/clanky/*.html; do
  cnt=0
  fname="${f##*/}"
  fname="${fname%.html}"
  id="$(hxselect -c "body > h::attr(id)" < "$f")"
  ctime="$(hxselect -c "body > h::attr(ctime)" < "$f")"
  mtime="$(hxselect -c "body > h::attr(mtime)" < "$f")"
  [[ -z "$mtime" ]] \
    && mtime="$ctime"
  kw="$(hxselect -c "body > h + desc::attr(kw)" < "$f")"
  echo -e "$id;$fname;$kw;$ctime;$mtime"
done

