#### This file was built by lightning. ####
#LBIN_PATH="$PWD/bin/" #only use for development
LBIN_PATH=""

lightning-reload() {
  lightning install $@
  source_file=$(lightning source_file)
  source $source_file
  echo Loaded $source_file
}


echo-gem () {
  local IFS=$'\n'
  local arr=( $(${LBIN_PATH}lightning-translate echo-gem $@) )
  echo "${arr[@]}"
}
complete -o default -C "${LBIN_PATH}lightning-complete echo-gem" echo-gem

echo-local_ruby () {
  local IFS=$'\n'
  local arr=( $(${LBIN_PATH}lightning-translate echo-local_ruby $@) )
  echo "${arr[@]}"
}
complete -o default -C "${LBIN_PATH}lightning-complete echo-local_ruby" echo-local_ruby

cd-gem () {
  local IFS=$'\n'
  local arr=( $(${LBIN_PATH}lightning-translate cd-gem $@) )
  cd "${arr[@]}"
}
complete -o default -C "${LBIN_PATH}lightning-complete cd-gem" cd-gem

cd-wild () {
  local IFS=$'\n'
  local arr=( $(${LBIN_PATH}lightning-translate cd-wild $@) )
  cd "${arr[@]}"
}
complete -o default -C "${LBIN_PATH}lightning-complete cd-wild" cd-wild

echo-ruby () {
  local IFS=$'\n'
  local arr=( $(${LBIN_PATH}lightning-translate echo-ruby $@) )
  echo "${arr[@]}"
}
complete -o default -C "${LBIN_PATH}lightning-complete echo-ruby" echo-ruby

cd-local_ruby () {
  local IFS=$'\n'
  local arr=( $(${LBIN_PATH}lightning-translate cd-local_ruby $@) )
  cd "${arr[@]}"
}
complete -o default -C "${LBIN_PATH}lightning-complete cd-local_ruby" cd-local_ruby

cd-ruby () {
  local IFS=$'\n'
  local arr=( $(${LBIN_PATH}lightning-translate cd-ruby $@) )
  cd "${arr[@]}"
}
complete -o default -C "${LBIN_PATH}lightning-complete cd-ruby" cd-ruby

echo-wild () {
  local IFS=$'\n'
  local arr=( $(${LBIN_PATH}lightning-translate echo-wild $@) )
  echo "${arr[@]}"
}
complete -o default -C "${LBIN_PATH}lightning-complete echo-wild" echo-wild
