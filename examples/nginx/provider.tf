provider "aws" {}

provider "docker" {
  host = "tcp://127.0.0.1:2376/"
}
