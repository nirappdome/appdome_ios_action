# $1 - {{github.event.inputs.p12_file}}
# $2 - ${{github.event.inputs.Provisioning_Profiles}}
# $3 - ${{github.event.inputs.entitlements_file}}
# $4 - ${{github.event.inputs.sign_overrids}}
# $5 - ${{github.event.inputs.ios_vanilla_file}}
mkdir files
mkdir files/provision_profile
mkdir files/entitlements
VAR=$1
echo $VAR
if [[ $i == htt* ]]; then
  echo "Downloading p12 file"
  wget $VAR -O files/cert.p12
elif [[ $VAR != '!' ]]; then
  echo "Copy p12 file"
  cp $VAR files/cert.p12
else
  echo "p12 not provided"
fi
counter=1
for i in $2
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
counter=1  
for i in $3
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
VAR=$4
if [[ $VAR == htt* ]]; then
  echo "Downloading json sign overrides"
  wget $VAR -O files/sign_overrides.json
elif [[ $VAR != '!' ]]; then
  echo "copy sign overrides file to files/sign_overrides.json"
  cp $VAR files/sign_overrides.json
else
  echo "sign overrides file not provided!"
fi
VAR=$5
if [[ $VAR == htt* ]]; then
  echo "Downloading vanilla application"
  wget $3 -O files/vanilla.apk
elif [[ $VAR != '!' ]]; then
  echo "copy vanilla file to files/vanilla.apk"
  cp $VAR files/vanilla.apk
else
  echo "vanilla file not provided!"
fi
ls files
