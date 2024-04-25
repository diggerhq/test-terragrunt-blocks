terraform {
  required_version = ">= 1.2.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.11.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "5.11.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.10.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.21"
    }
    ns1 = {
      source  = "ns1-terraform/ns1"
      version = "2.0.3"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.15.2"
    }
    github = {
      source  = "integrations/github"
      version = "5.26.0"
    }
  }
}
