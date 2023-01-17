# $1 - {{github.event.inputs.p12_file}}
# $2 - ${{github.event.inputs.sign_overrids}}
# $3 - ${{github.event.inputs.ios_vanilla_file}}
mkdir files
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
VAR=$2
if [[ $VAR == htt* ]]; then
  echo "Downloading json sign overrides"
  wget $VAR -O files/sign_overrides.json
elif [[ $VAR != '!' ]]; then
  echo "copy sign overrides file to files/sign_overrides.json"
  cp $VAR files/sign_overrides.json
else
  echo "sign overrides file not provided!"
fi
VAR=$3
if [[ $VAR == htt* ]]; then
  echo "Downloading vanilla application"
  wget $3 -O files/vanilla.ipa
elif [[ $VAR != '!' ]]; then
  echo "copy vanilla file to files/vanilla.apk"
  cp $VAR files/vanilla.ipa
else
  echo "vanilla file not provided!"
fi
ls files
