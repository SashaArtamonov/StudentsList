#!/bin/bash
echo "script for downloading latest artifact"
artifactory_server="http://192.168.56.110:8081/artifactory"
username="sasha"
password="2340262608Ss"
repo="StudentsList"
item="Parameters.xml"
path=$artifactory_server/$repo/$item
        url=$path
        echo $url
        cd C:\
		version=`curl -u $username:$password -k -s $path/maven-metadata.xml | grep latest | sed "s/.*<latest>\([^<]*\)<\/latest>.*/\1/"`
        wget  --user=$username --password=$password -q -N $url || { echo Error downloading $item; echo Deploy stopped; exit 1; }


