# $1 = ${{secrets.APPDOME_API_KEY}}
# $2 = ${{github.event.inputs.fusion_set_id}}
# $3 = ${{github.event.inputs.sign_options}}
# $4 = ${{github.event.inputs.sign_overrids}}
# $5 = ${{github.event.inputs.entitlements_file}}
# $6 = ${{github.event.inputs.p12_password}}
PRO=$(ls -d files/provision_profile/*)
ENT=$(ls -d files/entitlements/*)
mkdir output
CHOICE=$3
if [[ $CHOICE == "Appdome_Signing" ]];then
  VAR=$4
  if [[ $VAR != '!' ]]; then
    VAR=$5
    if [[ $VAR != '!' ]]; then
      sudo python3 appdome/appdome-api-python/appdome_api.py -key $1 -fs $2 --app ./files/vanilla.ipa --sign_on_appdome --keystore ./files/cert.p12 --keystore_pass $6 --sign_overrides files/sign_overrides.json --provisioning_profiles $PRO --entitlements $ENT --output ./output/appdome_vanilla.ipa --certificate_output ./output/certificate.pdf
    else
      sudo python3 appdome/appdome-api-python/appdome_api.py -key $1 -fs $2 --app ./files/vanilla.ipa --sign_on_appdome --keystore ./files/cert.p12 --keystore_pass $6 --sign_overrides files/sign_overrides.json --provisioning_profiles $PRO --output ./output/appdome_vanilla.ipa --certificate_output ./output/certificate.pdf
    fi
  else
    VAR=$5
    if [[ $VAR != '!' ]]; then
      sudo python3 appdome/appdome-api-python/appdome_api.py -key $1 -fs $2 --app ./files/vanilla.ipa --sign_on_appdome --keystore ./files/cert.p12 --keystore_pass $6 --provisioning_profiles $PRO --entitlements $ENT --output ./output/appdome_vanilla.ipa --certificate_output ./output/certificate.pdf
    else
      sudo python3 appdome/appdome-api-python/appdome_api.py -key $1 -fs $2 --app ./files/vanilla.ipa --sign_on_appdome --keystore ./files/cert.p12 --keystore_pass $6 --provisioning_profiles $PRO --output ./output/appdome_vanilla.ipa --certificate_output ./output/certificate.pdf
    fi
  fi
elif [[ $CHOICE == "Private_Signing" ]];then
  sudo python3 appdome/appdome-api-python/appdome_api.py -key $1 -fs $2 --app ./files/vanilla.ipa --private_signing --sign_overrides files/sign_overrides.json --provisioning_profiles $PRO --output ./output/appdome_vanilla.ipa --certificate_output ./output/certificate.pdf
elif [[ $CHOICE == "Auto_Dev_Private_Signing" ]];then
  VAR=$4
  if [[ $VAR != '!' ]]; then
    sudo python3 appdome/appdome-api-python/appdome_api.py -key $1 -fs $2 --app ./files/vanilla.ipa --auto_dev_private_signing --sign_overrides files/sign_overrides.json --provisioning_profiles $PRO --entitlements $ENT --output ./output/appdome_vanilla.ipa --certificate_output ./output/certificate.pdf
  else
    sudo python3 appdome/appdome-api-python/appdome_api.py -key $1 -fs $2 --app ./files/vanilla.ipa --auto_dev_private_signing --provisioning_profiles $PRO --entitlements $ENT --output ./output/appdome_vanilla.ipa --certificate_output ./output/certificate.pdf
  fi
fi
ls output
