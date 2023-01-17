mkdir files/entitlements
VAR=$1
echo $VAR
counter=1
for i in $VAR
  do
    if [[ $i == htt* ]]; then
      echo "Downloading entitlement file"
      wget $i -O "files/entitlements/${counter}.plist"
    elif [[ $VAR != '!' ]]; then
      echo "Copy entitlement file"
      cp $i "files/entitlements/${counter}.plist"
    else
      echo "entitlement file not provided"
    fi
    ((counter++))
  done
