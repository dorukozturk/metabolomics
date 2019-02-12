workflow "Docker Build and Publish" {
  on = "push"
  resolves = ["Publish"]
}

action "Build" {
  uses = "actions/docker/cli@master"
  args = "build -f devops/Dockerfile -t dozturk2/metabolomics:latest ."
}

action "Publish Filter" {
  needs = ["Build"]
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Publish" {
  needs = ["Build"]
  uses = "actions/action-builder/docker@master"
  runs = "make"
  args = "publish"
}
