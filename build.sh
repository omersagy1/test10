js_out="dist/main.js"
min_out="dist/main.min.js"

echo "building..."

elm make src/Main.elm --output=$js_out --optimize

uglifyjs $js_out --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe' | uglifyjs --mangle --output=$min_out

echo "Compiled size:$(cat $js_out | wc -c) bytes  ($js_out)"
echo "Minified size:$(cat $min_out | wc -c) bytes  ($min_out)"
echo "Gzipped size: $(cat $min_out | gzip -c | wc -c) bytes"