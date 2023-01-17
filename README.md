# Appdome iOS Fuse&Sign action

An action for fuse and sign you iOS vanilla application with Appdome.

# Usage

See [action.yml](action.yml)

```yaml
# Appdome Signing option:
steps:
uses: nirappdome/appdome_ios_action@1.0
with:
  ios_vanilla_file: "Mandetory - Https download link OR path to vanilla file on your repository"
  Fusion_set_id: "Mandetory - Appdome fusion set id"
  sign_options: "Mandetory - Appdome_Signing"
  appdome_key: Mandetory - ${{secrets.APPDOME_API_KEY}}
  sign_overrides: "Optional - Https download link OR path to sign_overrides.json file on your repository OR delete the input if no need "
  p12_file: "Mandetory - Https download link OR path to keystore file on your repository"
  p12_password: "Mandetory - p12 password"
  Provisioning_Profiles: "Mandetory - Https download link OR path to sign_overrides.json file on your repository OR delete the input if no need "
  entitlements_file: "Optional - Https download link OR path to sign_overrides.json file on your repository OR delete the input if no need "

# Private Signing option:
steps:
uses: nirappdome/appdome_android_action@1.0
with:
  ios_vanilla_file: "Mandetory - Https download link OR path to vanilla file on your repository"
  Fusion_set_id: "Mandetory - Appdome fusion set id"
  sign_options: "Mandetory - Private_Signing"
  appdome_key: Mandetory - ${{secrets.APPDOME_API_KEY}}
  sign_overrides: "Mandetory - Https download link OR path to sign_overrides.json file on your repository OR delete the input if no need "
  Provisioning_Profiles: "Mandetory - Https download link OR path to sign_overrides.json file on your repository OR delete the input if no need "


# Auto-Dev Private Signing option:
steps:
uses: nirappdome/appdome_android_action@1.0
with:
  ios_vanilla_file: "Mandetory - Https download link OR path to vanilla file on your repository"
  Fusion_set_id: "Mandetory - Appdome fusion set id"
  sign_options: "Mandetory - Auto_Dev_Private_Signing"
  appdome_key: Mandetory - ${{secrets.APPDOME_API_KEY}}
  sign_overrides: "Optional - Https download link OR path to sign_overrides.json file on your repository OR delete the input if no need "
  entitlements_file: "Mandetory - Https download link OR path to sign_overrides.json file on your repository OR delete the input if no need "
```
