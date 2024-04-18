# Terraform Okta CIC (Auth0) Customization/Branding Demo

This project allows your to customize the following within your Okta CIC tenant.
* Enable a custom domain and add record to you the following DNS provider(s):
    * AWS
    * Digital Ocean (Coming Soon)
* Branding the Okta CIC login widget
* Create a custom Okta CIC branding theme
* Enable Create custom prompts

## Disclaimer :warning:
---
This project serves as a Sample Demo, that you can tweak or completely re-purpose.

## Assumptions
This project assumes you have the following basic knowledge of the CIC platform.

## Prerequisties
* Terraform v1.8.1+
* Amazon Web Service (AWS) Tenant -- If you do not already have an AWS Tenant, you can create one [here](https://portal.aws.amazon.com/billing/signup#/start/email).
* Okta CIC Tenant (Auth0) -- If you do not already have an Auth0 Tenant, you can create one [here](https://auth0.com/signup?place=header&type=button&text=sign%20up).

### Demo Setup Steps
1. Register Machine-to-Machine Applications [How-to](https://auth0.com/docs/get-started/auth0-overview/create-applications/machine-to-machine-apps)
2. Create an AWS IAM User [How-to](https://developer.okta.com/blog/2020/04/24/okta-terraform-automate-identity-and-infrastructure#create-an-aws-iam-user)

### Installation and Configuration
1. Clone the repo
```bat
git clone https://github.com/intheorysecurity/terraform-auth0-customization-project
```

2. Copy the contents of the terraform.tfvars.example file.
```powershell
#Windows
copy terraform.tfvars.example terraform.tfvars

#Linux
cp terraform.tfvars.example terraform.tfvars
```
3. Update the following variables in the terraform.tfvars file from the info gathered during the [Demo Setup Steps](#demo-setup-steps)

```powershell
//************************************
//  AWS Environment Variables Section
//************************************
aws_region     = "us-east-1"
aws_access_key = "my-access-key"
aws_secret_key = "my-secret-key"

//************************************
//  Auth0 Tenant Variables Section
//************************************
auth0_domain        = "example.us.auth0.com"
auth0_clientID      = "applicationClientID"
auth0_client_secret = "applicationClientSecret"
//Optional
# auth0_debug = true
```

> [!NOTE]
> In order to leverage the following features, you need to enable a custom domain on your CIC Tenant.
> You can manual create a custom domain within your CIC Tenant by clicking [here](https://auth0.com/docs/customize/custom-domains/auth0-managed-certificates), or add the following to your terraform.tfvars file depending on your DNS provider
>
>* AWS Route 53
>```powershell
>/* Auth0 configuration required to enable a custom domain */
>enable_custom_domain_record = true
>dns_providers               = "aws"
>custom_domain               = "<Your custom domain URL> (e.g customdomain.example.local)"
>root_domain                 = "<Your root domain> (e.g example.local)"
>```
>
>* Digital Ocean (COMING SOON)


## Contributing
---
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
---
[MIT](https://choosealicense.com/licenses/mit/)