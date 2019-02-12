workflow "Docker Build and Publish" {
  on = "push"
  resolves = ["Publish"]
}

action "Build" {
  uses = "actions/docker/cli@master"
  args = "build -f devops/Dockerfile -t dozturk2/metabolomics:latest ."
}

action "Login" {
  needs = ["Build"]
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Publish" {
  needs = ["Login"]
  uses = "actions/docker/cli@master"
  args = "push dozturk2/metabolomics:latest"
}
