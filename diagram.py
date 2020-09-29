from diagrams import Diagram, Cluster
from diagrams.aws.compute import ECR

with Diagram("AWS ECR Repository", show=False, direction="TB"):

    ECR("ecr repository") << ECR("lifecycle policy")
