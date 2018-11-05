fix_spaces(){
    file=$1
    sed -i -- 's/\/ /\//g' "$file"
    rm -f "$file--"
}

format(){
    file_in=$1
    tidy -i -bare -xml -ascii -q -m "$file_in"
}

trans_html(){
    file_path_abs=$(realpath $1)
    file_in="file:///$file_path_abs"
    lang=$2
    file_out="$lang.html"

    trans -no-autocorrect :$lang "$file_in" > $file_out
    fix_spaces $file_out
    format $file_out
}

escape_html(){
    file_in=$1
    cat $file_in | perl -n -mHTML::Entities -e ' ; print HTML::Entities::encode_entities($_) ;'
}

alias ll="ls -lha --color"