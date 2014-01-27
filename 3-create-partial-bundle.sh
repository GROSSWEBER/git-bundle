#!/bin/sh

bundle=../partial

echo "Creating bundle $bundle"
git bundle create $bundle master~13..master

echo -e "\nVerifying bundle $bundle"
git bundle verify $bundle

echo -e "\nHEADs in bundle $bundle"
git bundle list-heads $bundle
