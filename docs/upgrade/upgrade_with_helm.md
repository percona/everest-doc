# Upgrade Percona Everest using Helm

Percona Everest consistently delivers updates that includes bug fixes, security enhancements, and various improvements designed to optimize the overall performance of your database.

## Before you upgrade

!!! note
    - Upgrade one minor release at a time to avoid unexpected issues. Start by updating to the latest patch release before moving on to the next minor release.
    - For a safe upgrade, we perform a pre-upgrade hook that runs a series of checks. You can disable this by setting `upgrade.preflightChecks=false`However, but doing so means a safe upgrade cannot be assured.


 

