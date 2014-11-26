#
# Raspberry Bundle
# ==============================================================================
#
# This module is used to make configurations on the pi, install essential
# packages and remove unused packages, add users, etc
#
include:
  - raspberry.cleanup
  - raspberry.tools
  - raspberry.users


