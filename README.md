# personal-site-aws
Top-level architecture for a simple personal site, maintained with Terraform

## Architecture

### Iteration 1

**Terraform**
Terraform's AWS provider will be responsible for deploying, modifying, and tearing down all resources required by this project. Any project-specific nomenclature, e.g. account names and IDs or relevant web domains, will be parameterized and drawn from a `.tfvars` file.

**CloudFront**

A CloudFront distribution will be used to cache responses from the blog site. The goal here is to limit S3 fetches and lambda and API GW hits and not so much to optimize for access across geographic regions. It will sit in front of the API Gateway. In later iterations, when this site will contain an application for provisioning VTT servers, it may have to be moved or reconfigured to only cache blog content instead of all responses from the gateway

**API Gateway**

An HTTP API Gateway resource will route three paths to a single Lambda function:

| Path        | Description                                      |
|-------------|--------------------------------------------------|
| `/`         | Retrieve an "under construction" page from the S3 bucket             |
| `/blog/*`   | Retrieve blog content from the S3 bucket   |
| `/vtt/*`    | Retrieve an "under construction" page from the S3 bucket             |

For the construction pages, the API GW will sub in an appropriate value for a {resourcePath} path parameter.

SSL Termination will be covered in a later iteration.

** Lambdas **

A simple NodeJS Lambda function will be created. It will connect to the configured private S3 bucket using an assumed role to retrieve blog site content.

** S3  **

A private S3 bucket will be created to contain blog site content. This content will be stored in and deployed from a different repository.

### Commentary

It would be simpler to deploy a blog site with GitHub pages, or with an EC2 instance running Ghost or similar, but the main purpose of this project is continued education, and, discounting that, a later iteration will comprise a service to provision, monitor, and tear down EC2 instances running virtual table top software for hosting DND, Pathfinder, or similar with friends. If the later goal is ephemeral instances to share non-simultaneous use of VTT software licenses or to minimize EC2 costs, then I don't want to start with a persistent blog instance. 

## Usage

TBD