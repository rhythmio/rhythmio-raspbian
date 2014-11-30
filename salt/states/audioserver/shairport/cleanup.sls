#
# Removes shairport build requirements and sources
#
shairport_build_cleanup:
  file.absent:
    - name: '/tmp/shairport-master'
  pkg.purged:
    - pkgs:
      - libssl-dev 
      - libavahi-client-dev
      - libasound2-dev

