#terraform.tfvars
region = "sa-east-1"
access_key = "${{ secrets.AWS_ACCESS_KEY_ID }}"
secret_key = "${{ secrets.AWS_SECRET_ACCESS_KEY }}"
cluster_name = "tech-challenge-eks"
cluster_version = "1.27"