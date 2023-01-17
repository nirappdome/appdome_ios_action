VAR=$1
echo $VAR
counter=1
for i in $VAR
  do
    if [[ $i == htt* ]]; then
      echo "Downloading provision profile file"
      wget $i -O "files/provision_profile/${counter}.mobileprovision"
    elif [[ $VAR != '!' ]]; then
      echo "Copy provision profile file"
      cp $i "files/provision_profile/${counter}.mobileprovision"
    else
      echo "Provision profile file not provided"
    fi
    ((counter++))
  done
