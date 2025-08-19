# Resume Website Deployment with Terraform and Netlify

This project contains the source code for my personal resume website and the Terraform configuration to deploy it automatically to Netlify.

## Architecture

The infrastructure for this website is managed by Terraform. The key components are:

- **Netlify**: The website is deployed as a Netlify site.
- **GitHub**: The source code is hosted on GitHub. Terraform configures a deploy key in the GitHub repository to allow Netlify to access the code.
- **Terraform Cloud**: The Terraform state is managed in Terraform Cloud.

## Technologies Used

- **Frontend**: HTML, CSS, JavaScript (with Bootstrap)
- **Infrastructure as Code**: Terraform
- **Platform**: Netlify, AWS

### Project Structure
```bash
.
├── resume.tf                  # Main Terraform configuration
├── providers.tf               # Provider configurations
├── variables.tf               # Variable definitions
├── outputs.tf                 # Output definitions
├── versions.tf                # Provider configuration versions
└── README.md                  
```

## Prerequisites

Before you begin, you will need the following:

- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) installed on your local machine.
- A [Netlify account](https://app.netlify.com/signup) and a personal access token.
- A [GitHub account](https://github.com/join) and a personal access token with `repo` permissions.
- A [Terraform Cloud](https://app.terraform.io/signup/account) account.
- [AWS Credentials](https://ap-southeast-2.signin.aws.amazon.com/oauth?client_id=arn%3Aaws%3Asignin%3A%3A%3Aconsole%2Fcanvas&code_challenge=zcY1mWVXgpTuJfJ9Fg8R6OCT82RmnSRuXU5Rp0MLHEE&code_challenge_method=SHA-256&response_type=code&redirect_uri=https%3A%2F%2Fconsole.aws.amazon.com%2Fconsole%2Fhome%3FhashArgs%3D%2523%26isauthcode%3Dtrue%26nc2%3Dh_si%26src%3Dheader-signin%26state%3DhashArgsFromTB_ap-southeast-2_8defb2531c888ec3) 
  1. Access Key ID and Secret Access Key
  2. User must have Route 53 permissions
  3. Existing AWS Route 53 Hosted Zone
     - You must have an existing hosted zone for your domain (e.g., `preciousdipe.com.ng`)

## Configuration

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/preciousdipe/Terraform-Netlify-Resume-Deploy.git
    cd Terraform-Netlify-Resume-Deploy
    ```

2.  **Set up Terraform Cloud:**
    - The `terraform/versions.tf` file is configured to use Terraform Cloud. You will need to log in to Terraform Cloud from your CLI:
      ```bash
      terraform login
      ```
    - Make sure you have a workspace created `your-worspace-name` in your Terraform Cloud organization (`org-name`).

3.  **Configure Environment Variables:**
    The Terraform configuration requires two sensitive variables: your Netlify token and your GitHub token. It's recommended to set these as terraform variables in your Terraform Cloud workspace.

    ```hcl
    netlify_token = "your_netlify_token"
    github_token  = "your_github_token"
    ```

## Usage

1.  **Navigate to the terraform directory:**
    ```bash
    cd terraform
    ```

2.  **Initialize Terraform:**
    This will download the necessary providers and configure the backend.
    ```bash
    terraform init
    ```

3.  **Plan the deployment:**
    This will show you what resources Terraform will create.
    ```bash
    terraform plan
    ```

4.  **Apply the configuration:**
    This will create the Netlify site and deploy the website.
    ```bash
    terraform apply -auto-approve
    ```

## Terraform Outputs

After a successful deployment, Terraform will output the following information:

-   `site_name`: The unique name of your Netlify site.
-   `site_url`: The URL of your live website (e.g., `https://resume-abcd.netlify.app`).
-   `custom_domain_url`: The URL of your live website using your custom-domain (e.g., [https://netlify.preciousdipe.com.ng](https://netlify.preciousdipe.com.ng) )
