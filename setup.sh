
#!/usr/bin/bash

script=$(basename ${0})

opwd="$(pwd)"

# cd $(dirname ${0})
cd ${HOME}

mkdir .save > /dev/null 2>&1
d=$(date +%Y%m%d_%H%M%S)

cp .bashrc .save/.bashrc_${d}
printf "backup = %s\n" "$(ls -l .save/.bashrc_${d})"


cat > ~/.bashrc <<'EOF'

# -----------------------------------------------------------------------------
#
#
opwd=$(pwd)

if [ -f ~/.login/login-wrapper ]
then
  . .login/login-wrapper
  cd ${opwd}
  return 0
fi

#
#
# -----------------------------------------------------------------------------
EOF

cat /etc/skel/.bashrc >> .bashrc

cd ${opwd}
exit 0

