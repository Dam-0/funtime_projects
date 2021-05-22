#!/bin/bash

for i in *.mp3 ; do 
    ffmpeg -i "$i" -acodec flac "$(basename "${i/.mp3}")".flac
done
