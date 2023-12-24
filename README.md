Terraform basic infrastructure setup with AWS... mostly just for practice.


Working towards this diagram setup (in progress):
<img src="./images/sc.png" alt="goal1">

- Use `backend_setup/` to create two separate AWS S3 buckets for TF State storage (development and production)
- The TF State for the backend is managed locally (init and apply from within `backend_setup/`)
- Place the names of each created bucket into the following files: `env/backend_s3_<env>.hcl`
- Provide the backend config when performing init from project root: `terraform init -backend-config="env/backend_s3_dev.hcl"`
