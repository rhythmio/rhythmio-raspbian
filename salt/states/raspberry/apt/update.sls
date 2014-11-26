
raspbian_update:
  cmd.run:
    - name: "apt-get --yes update"
    - onlyif: 'test $[$(date +%s) - $(stat -c %Y /var/lib/apt/lists/$(ls /var/lib/apt/lists/ -tr1|tail -1))] -gt 86400'
