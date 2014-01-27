#!/bin/sh

bundle=../full

echo "Creating bundle $bundle"
git bundle create $bundle master

echo -e "\nVerifying bundle $bundle"
git bundle verify $bundle

echo -e "\nHEADs in bundle $bundle"
git bundle list-heads $bundle
