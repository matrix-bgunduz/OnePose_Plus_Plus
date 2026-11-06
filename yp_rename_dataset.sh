set -e

DATASET_FOLDER=$1

cd $DATASET_FOLDER
rm model.ply


for dir in *; do
    #delete if file
    if [[ -f $dir ]]; then
        rm -rf dir
        continue
    fi

    DIR_NAME=0000-${dir%-*}
done

for dir in */; do
    cp $dir/box3d_corners.txt .
    break
done

mkdir $DIR_NAME
for f in *; do
  [ "$f" = "$DIR_NAME" ] || mv "$f" "$DIR_NAME"/
done