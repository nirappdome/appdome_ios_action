PRO=$(ls -d files/provision_profile/*)
ENT=$(ls -d files/entitlements/*)
mkdir output
CHOICE="${{github.event.inputs.sign_otions}}"
if [[ $CHOICE == "Appdome Signing" ]];then
  VAR=${{github.event.inputs.sign_overrids}}
  if [[ -n $VAR ]]; then
    VAR=${{github.event.inputs.entitlements_file}}
    if [[ -n $VAR ]]; then
      sudo python3 appdome/appdome-api-python/appdome_api.py -key ${{secrets.APPDOME_API_KEY}} -fs ${{github.event.inputs.fusion_set_id}} --app ./files/vanilla.ipa --sign_on_appdome --keystore ./files/cert.p12 --keystore_pass ${{github.event.inputs.p12_password}} --sign_overrides files/sign_overrides.json --provisioning_profiles $PRO --entitlements $ENT --output ./output/appdome_vanilla.ipa --certificate_output ./output/certificate.pdf
    else
      sudo python3 appdome/appdome-api-python/appdome_api.py -key ${{secrets.APPDOME_API_KEY}} -fs ${{github.event.inputs.fusion_set_id}} --app ./files/vanilla.ipa --sign_on_appdome --keystore ./files/cert.p12 --keystore_pass ${{github.event.inputs.p12_password}} --sign_overrides files/sign_overrides.json --provisioning_profiles $PRO --output ./output/appdome_vanilla.ipa --certificate_output ./output/certificate.pdf
    fi
  else
    VAR=${{github.event.inputs.entitlements_file}}
    if [[ -n $VAR ]]; then
      sudo python3 appdome/appdome-api-python/appdome_api.py -key ${{secrets.APPDOME_API_KEY}} -fs ${{github.event.inputs.fusion_set_id}} --app ./files/vanilla.ipa --sign_on_appdome --keystore ./files/cert.p12 --keystore_pass ${{github.event.inputs.p12_password}} --provisioning_profiles $PRO --entitlements $ENT --output ./output/appdome_vanilla.ipa --certificate_output ./output/certificate.pdf
    else
      sudo python3 appdome/appdome-api-python/appdome_api.py -key ${{secrets.APPDOME_API_KEY}} -fs ${{github.event.inputs.fusion_set_id}} --app ./files/vanilla.ipa --sign_on_appdome --keystore ./files/cert.p12 --keystore_pass ${{github.event.inputs.p12_password}} --provisioning_profiles $PRO --output ./output/appdome_vanilla.ipa --certificate_output ./output/certificate.pdf
    fi
  fi
elif [[ $CHOICE == "Private Signing" ]];then
  sudo python3 appdome/appdome-api-python/appdome_api.py -key ${{secrets.APPDOME_API_KEY}} -fs ${{github.event.inputs.fusion_set_id}} --app ./files/vanilla.ipa --private_signing --sign_overrides files/sign_overrides.json --provisioning_profiles $PRO --output ./output/appdome_vanilla.ipa --certificate_output ./output/certificate.pdf
elif [[ $CHOICE == "Auto-Dev Private Signing" ]];then
  VAR=${{github.event.inputs.sign_overrids}}
  if [[ -n $VAR ]]; then
    sudo python3 appdome/appdome-api-python/appdome_api.py -key ${{secrets.APPDOME_API_KEY}} -fs ${{github.event.inputs.fusion_set_id}} --app ./files/vanilla.ipa --auto_dev_private_signing --sign_overrides files/sign_overrides.json --provisioning_profiles $PRO --entitlements $ENT --output ./output/appdome_vanilla.ipa --certificate_output ./output/certificate.pdf
  else
    sudo python3 appdome/appdome-api-python/appdome_api.py -key ${{secrets.APPDOME_API_KEY}} -fs ${{github.event.inputs.fusion_set_id}} --app ./files/vanilla.ipa --auto_dev_private_signing --provisioning_profiles $PRO --entitlements $ENT --output ./output/appdome_vanilla.ipa --certificate_output ./output/certificate.pdf
  fi
fi
ls output
