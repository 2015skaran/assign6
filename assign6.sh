export filename=$1

if [[ -e $filename ]];
then
    echo "Line Count: " wc -l $1
    echo "word count"
    wc -w $1
    echo "most repeated word"
    cat $1 | tr '[:space:]' '[\n*]' | sort | uniq -c | sort -bnr | head -n 1
    echo "least repeated word"
    cat $1 | tr '[:space:]' '[\n*]' | sort | uniq -c | sort -bnr | tail -n 1
    echo "words beginning and ending with d"
    cat $1 | tr '[:space:]' '[\n*]' | grep -e '[d|D][a-zA-Z]\{0,\}[d|D]' | sort | uniq -c | sort -bnr
    echo "words beginning with a"
    cat $1 | tr '[:space:]' '[\n*]' | grep -e '^[a|A][a-zA-Z]*' | sort | uniq -c | sort -bnr
    echo "numeric words "
    cat $1 | tr '[:space:]' '[\n*]' | grep -e '[0-9]\{1,\}' | grep -v -e '[a-zA-Z@,$\(\)";]\{1,\}' | sort | wc -l
    echo "alphanumeric words "
    cat $1 | tr '[:space:]' '[\n*]' | grep -e '[0-9a-zA-Z]\{1,\}' | sort | wc -l
else
    echo "Please provide a file as a command line argument"
fi
