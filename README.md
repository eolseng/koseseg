This is a [Next.js](https://nextjs.org/) project for [www.SkalViKoseOss.no](https://www.skalvikoseoss.no)

### Tech:
* Hosted on `Google Cloud Platform` with `Cloud Run`
* Private Image Repository on `Google Container Registry`
* Infrastructure as Code (IaC) with `Terraform` with `Google Cloud Storage` as backend
* Built, containerized and deployed with `Travis-CI`

#### GCP Service Account Roles for Travis-CI:
* `Service Account User` - allows the account to run Terraform operations as other service accounts.
* `Storage Admin` - allows the service account to access Cloud Storage for Container Registry and Terraform Backend.
* `Cloud Run Admin` - allows the service account to have full control over Cloud Run resources.
