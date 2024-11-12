# Gitops-ify terraform with TMC

This repo is an example of how to use the [terraform controller](https://flux-iac.github.io/tofu-controller/) for Flux to GitOps-ify automating TMC with the terraform provider. It also uses Flux provided by TMC to orchestrate this, creating a kind of TMC GitOps inception. This is a very simplified repo, just to show an example. The Flux structure and Terraform structure are overly simplified as well, however this should provide a good starting point for how to integrate this into a more enterprise repo structure.

# How it works

There are a few steps to how this repo works.

1. use the TMC provided CD feature to bootstrap clusters with Flux
2. use Flux to install the Terraform controller for Flux
3. Setup the Terraform Controller to use the [Branch Planner](https://flux-iac.github.io/tofu-controller/branch-planner/) feature.
4. create a Terraform resource to watch the Terraform git repo
5. create a new branch and PR with your TF changes and watch the branch planner work
6. merge the branch and the Terraform resource will reconcile

# Setup

## Pre-reqs

* TMC
* TMC cluster
* TMC API TOKEN
* [GitHub API Token](https://flux-iac.github.io/tofu-controller/branch-planner/branch-planner-getting-started/#prerequisites)

## Enable CD on your TMC Cluster/ClusterGroup

Steps to do this can be found in the official docs. For simplicity the steps are outlined below.

1. enable Continous Delivery on the cluster

2. enable Helm Releases on the cluster

3. add a git repo to the cluster and point it at this repo

4. create a base kustmization that uses the git repo and the `flux` path in this repo



# Usage

Once everything is reconciled after the setup the follow explains how to use this.

## Updating Terraform code

All of the code for terraform lives in the `terraform` directory this is what is reconciled by the flux terraform resource. Make your changes to this and submit a PR to the main branch. Thsi will trigger the Branch Planner to execute a `terraform plan` and then write the results back to the PR as a comment. Merge the branch and the Terraform Controller will then reconcile main and run the `terraform apply`. 

**NOTE: if you push direct to main it will auto apply**


## Updating Flux Code

All of the Flux code lives in the `flux` directory. This includes the `HelmRelease` that installs the terraform controller. You can add any other things that need to be installed here. also this can be changed to update config for the Terraform Controller. 