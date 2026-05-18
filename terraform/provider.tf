# Terraform 버전 및 Provider 설정
terraform {

  # 사용할 Terraform 최소 버전
  required_version = ">= 1.8.0"

  # 사용할 Provider 목록
  required_providers {

    # AWS Provider 설정
    aws = {

      # Provider 소스
      source = "hashicorp/aws"

      # Provider 버전
      version = "~> 5.0"
    }
  }
}

# AWS Provider 설정
provider "aws" {

  # 사용할 AWS 리전
  region = "us-east-1"

  # AWS CLI profile 이름
  # ~/.aws/credentials 에 등록된 profile 사용
  profile = "default"
}
