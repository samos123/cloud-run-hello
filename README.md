# Go buildpack cloud run CD example

So you have devs that don't want to learn anything? Welcome to buildpacks
and cloud run which allows your developers to focus on coding while
getting the benefits of containers and K8s without having to learn
either technology.

This repistory is setup for CD to cloud run by using Cloud Build. Cloud Build
will do the following things:

- Create a docker image from source code even though no Dockerfile is present in
  this repo. It will also push the image to gcr.io so it can be used by Cloud Run.
- Deploy a Cloud Run service with the newly built image

See the file `cloudbuild.yaml` in this repo for reference.
