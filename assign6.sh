export filename=$1

# Checks if filename argument is given
if [[ -e $filename ]];
then
    # counts number of lines
    echo "Line Count: " 
    wc -l $1
    # counts number of words
    echo "Word Count:"
    wc -w $1
    # finds most repetitive word
    echo "Most Repeated Word:"
    cat $1 | tr '[:space:]' '[\n*]' | sort | uniq -c | sort -bnr | head -n 1
    # find least repetitive word
    echo "Least Repeated Word"
    cat $1 | tr '[:space:]' '[\n*]' | sort | uniq -c | sort -bnr | tail -n 1
    # starts with "d" and ends with "d" can be upper or lower
    echo "Number of Words beginning/ending with d"
    cat $1 | tr '[:space:]' '[\n*]' | grep -e '[d|D][a-zA-Z]\{0,\}[d|D]' | sort | uniq -c | sort -bnr
    # Starts with A or a
    echo "Number of Words beginning with A or a"
    cat $1 | tr '[:space:]' '[\n*]' | grep -e '^[a|A][a-zA-Z]*' | sort | uniq -c | sort -bnr
    # count numeric words
    echo "Number of Numeric words "
    cat $1 | tr '[:space:]' '[\n*]' | grep -e '[0-9]\{1,\}' | grep -v -e '[a-zA-Z@,$\(\)";]\{1,\}' | sort | wc -l
    # count alphanumeric words
    echo "Number of Alphanumeric words "
    cat $1 | tr '[:space:]' '[\n*]' | grep -e '^[0-9a-zA-Z_]*$' | sort | wc -l
else
    echo "No file name provided"
fi
