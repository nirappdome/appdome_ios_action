mkdir files
mkdir files/provision_profile
mkdir files/entitlements
VAR=${{github.event.inputs.p12_file}}
if [[ $VAR != '' ]]; then
  wget $VAR -O files/cert.p12
fi
counter=1
for i in ${{github.event.inputs.Provisioning_Profiles}}
  do
    wget $i -O "files/provision_profile/${counter}.mobileprovision"
    provision_profile_paths="$provision_profile_paths files/provision_profile/${counter}.mobileprovision"
    ((counter++))
  done
counter=1  
for i in ${{github.event.inputs.entitlements_file}}
  do
    wget $i -O "files/entitlements/${counter}.plist"
    entitlements_paths="$entitlements_paths files/entitlements/${counter}.plist"
    ((counter++))
  done
VAR=${{github.event.inputs.sign_overrids}}
if [[ $VAR != '' ]]; then
  echo "Downloading json sign overrides"
  wget ${{github.event.inputs.sign_overrids}} -O files/sign_overrides.json
fi
wget ${{github.event.inputs.ios_vanilla_file}} -O files/vanilla.ipa
ls files
