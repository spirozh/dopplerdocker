#!/bin/sh

# if you push up to the master branch of the aptible git repo, aptible will redeploy the app, but will
# reset the configuration vars.  you must then set the configuration vars with 'aptible config:set' but
# aptible will redeploy the app.
#
# in order to push up to aptible and deploy with configuration vars set a single time, you must push to
# a branch other than master, and then you can deploy from that branch with the configuration vars set
# at that time.
#
# this script demonstrates how to push and then deploy with the configuration vars set.

APTIBLE_ENVIRONMENT=qa-nocd
APTIBLE_APPNAME=test-app
BRANCH="deploy-$(date "+%s")"

# push the repo from the local master up to a branch on the repo named with the repospec
# git push <repospec> <local_branch>:<repo_branch>
git push git@beta.aptible.com:"$APTIBLE_ENVIRONMENT"/"$APTIBLE_APPNAME".git master:"$BRANCH"

# deploy the branch on the aptible git repo with the DOPPLER_TOKEN set
aptible deploy --app "$APTIBLE_APPNAME" --git-commitish "$BRANCH" DOPPLER_TOKEN=$(cat testtoken)