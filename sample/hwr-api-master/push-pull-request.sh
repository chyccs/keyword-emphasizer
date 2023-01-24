$git push --set-upstream origin '$name'
tag=$(echo "$name" | sed 's/-/ /g' | sed 's/\(.*\)(\(.*\))\(.*\)/\2/g')
message=$(echo "$name" | sed 's/-/ /g' | sed 's/\(.*\)(\(.*\))\(.*\)/\1\3/g' | awk '{$1=$1};1' | awk '{ print toupper( substr( $0, 1, 1 ) ) substr( $0, 2 ); }')
title=$(echo "($tag) $message")
encoded=$(perl -MURI::Escape -e 'print uri_escape shift, , q{^A-Za-z0-9\-._~/:}' -- "$title")
open -a "Google Chrome" "https://github.com/NeoSmartpen/hwr-api/compare/$name?title=$encoded&expand=1"
