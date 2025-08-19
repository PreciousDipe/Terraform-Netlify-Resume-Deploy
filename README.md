# Personal Resume Website with Terraform and Netlify

This project contains the source code for a personal resume website and the Terraform configuration to deploy it automatically to Netlify.

## Architecture

The infrastructure for this website is managed by Terraform. The key components are:

- **Netlify**: The website is deployed as a Netlify site.
- **GitHub**: The source code is hosted on GitHub. Terraform configures a deploy key in the GitHub repository to allow Netlify to access the code.
- **Terraform Cloud**: The Terraform state is managed in Terraform Cloud.

## Technologies Used

- **Frontend**: HTML, CSS, JavaScript (with Bootstrap)
- **Infrastructure as Code**: Terraform
- **Platform**: Netlify
- **CI/CD**: GitHub Actions (as inferred from the resume, though not explicitly in this repo's CI)

## Prerequisites

Before you begin, you will need the following:

- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) installed on your local machine.
- A [Netlify account](https://app.netlify.com/signup) and a personal access token.
- A [GitHub account](https://github.com/join) and a personal access token with `repo` permissions.
- A [Terraform Cloud](https://app.terraform.io/signup/account) account.

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
    - Make sure you have a workspace named `netlify-ws` in your Terraform Cloud organization (`resumechallenge_devops_projects`).

3.  **Configure Environment Variables:**
    The Terraform configuration requires two sensitive variables: your Netlify token and your GitHub token. It's recommended to set these as environment variables in your Terraform Cloud workspace.

    - `TF_VAR_netlify_token`: Your Netlify personal access token.
    - `TF_VAR_github_token`: Your GitHub personal access token.

    Alternatively, you can create a `terraform.tfvars` file in the `terraform` directory, but **do not commit this file to version control**.

    ```hcl
    # terraform/terraform.tfvars

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
    terraform apply
    ```

    Enter `yes` when prompted to confirm the changes.

## Terraform Outputs

After a successful deployment, Terraform will output the following information:

-   `site_url`: The URL of your live website (e.g., `https://resume-abcd.netlify.app`).
-   `site_name`: The unique name of your Netlify site.
