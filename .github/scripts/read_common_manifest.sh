- name: Read common manifest
  id: manifest
  run: |
    FOLDERS=$(sed -n 's/^\s*-\s*//p' shared/common.yml | paste -sd, -)
    echo "::set-output name=common_folders::$FOLDERS"
