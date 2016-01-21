INPUT=x.zip
for num in $(seq 1 70)
do
    echo "Copying file $num times:"
    rsync -avPp $INPUT /Volumes/My\ Passport/$INPUT$num
done
