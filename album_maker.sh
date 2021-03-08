#!/bin/sh
echo "[|retour/back|](..)"
echo "  "

for img in $(find "$1" -type f); do
    echo "![image](/$img)"
    echo "[taille réelle](/$img)"
done

echo "  "
echo "[|retour/back|](..)"
