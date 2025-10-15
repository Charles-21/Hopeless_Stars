	Name: Carlos Enrique Escobar Santiago
	Date: Sunday 29/June/2025
	Employee ID: WB02281711

----------------------------------------------------------------------------------------------------
#### <u>Content</u> 
Day 14: This day will be dedicated to the study of Channel Platform
Day 15: Official documentations on ICP filling

----------------------------------------------------------------------------------------------------
#### <u>Difficulties</u> 

Error 404 for Channel Platform official documentation.
I didn't understand the "Channel customer apply for release or migration to other channels" part. I think the image has errors

----------------------------------------------------------------------------------------------------
#### <u>Summary</u>

# Channel platform introduction

- **Agency**: 
	It's an intermediary. 
	It doesn't sell services directly; it simply introduces Alibaba Cloud to potential clients (such as companies, investors, etc). 
	If the client is interested and pays, the agency receives a commission.
	Alibaba Cloud collects and invoices the client directly; in other words, the agency doesn't interfere with collections or invoices.

- **Direct Reseller**: 
	This type of reseller sells Alibaba Cloud services directly or even creates its own products using Alibaba Cloud. 
	This type of reseller may be a company that builds cloud solutions and sells them to its customers.
	Alibaba Cloud gives the reseller a discount and sends them an invoice. 
	The reseller then charges the end customer, adding its own price.

- **Distributor**
	This is a step up from Direct Reseller.
	You can sell directly to customers, but you can also recruit other resellers (the so-called "Tier 2 Resellers").
	Alibaba Cloud also gives you a discount and sends you the invoice.
	The Distributor invoices their customers and their secondary resellers.
	Secondary resellers (Tier 2) sell to their own customers and also issue their own invoices.

The following diagram shows the process for becoming an Alibaba Cloud partner on its international site.
Broadly speaking, the procedure is more or less as follows:

- Registration: Create an account
- Application: Apply to join the partner program
- Review: Wait for your profile to be approved and your information validated
- NDA: Sign and upload the confidentiality agreement
- Contract: Negotiate terms and sign the final contract
- Final signature: Upload the signed contract
- Setup: Wait for permissions and discounts to be activated
- Training: Take the training and complete the portal

There's an internal Alibaba Cloud tool that allows you to view customer and distributor information (both first and second levels) using a unique identifier, UID (User ID). With this tool, you can trace the distribution chain back to the partners responsible for that user.
This can be used to escalate cases, validate affiliations, or assign responsibilities.
You can find the link on the page.

The following information is key if you are going to migrate a user to the reseller client mode

You will no longer be able to use coupons issued by the official Alibaba Cloud website.

In the Payment Center:
The payment method and coupon options will disappear.
The payment method is automatically changed to "quota" and cannot be changed.

Past invoices:
You can still view them, but only as pre-tax amounts.
You will not be able to download past invoices after the migration.
You must download them before migrating if you need them.
If you had unpaid invoices before the migration:
They will be automatically charged at the beginning of the following month.
The payment method you already registered (such as a credit card) will be charged.
Therefore, this payment method cannot be deleted during the migration month.

Once the customer is migrated:
Alibaba Cloud will charge the distributor directly for that customer's usage.
The distributor will be able to view their customers' usage records from their dashboard.

In short: Migrating a client to the reseller model completely changes how they pay for and manage their services. All payment control shifts to the distributor, and the client loses access to certain benefits and tools from the official site.

At the end of this section, as with most, you'll find a useful FAQ section.

For any content not included in the official website documents and our internal knowledge base, please contact the on-duty channel platform product colleague for further investigation

---------------------------

# ICP Filing
Learn to use ICP filing step by step！

ICP = Internet content provider

It is a mandatory permit or registration in China to operate a website or app within the country. If you want your website or app to work in mainland China (using servers there), you need this registration.

There are two types:
ICP Filing: For non-commercial sites (blogs, informational pages, etc.).
ICP License: For commercial sites (online stores, paid apps, etc.).

If you don't have one, you can't offer services from your site or app in China.

If you use Alibaba Cloud with servers in mainland China and don't follow these steps:
Your site will be suspended by Alibaba Cloud's monitoring system.
You will be asked to obtain the ICP filing.

If you already have an ICP filing from another provider, but are now using Alibaba Cloud, you must register that filing in the Alibaba system.
Failure to register will also result in suspension of your site or app.

A flowchart for this procedure can be found in the official documentation.

CDN = Content Delivery Network

In the Scenarios section, the documentation explains how ICP filing applies in different contexts, such as regular websites, overseas enterprises, and when using services like OSS, CDN, WAF, or Anti-DDoS Pro.  
Additionally, there are dedicated sections outlining the relevant terms and listing important limitations.

When using Alibaba Cloud servers, you can submit your filing application through the Alibaba Cloud ICP Filing Management System. Once the review is approved, you can activate the website or app. This topic provides a guide on the process and important considerations for submitting ICP filings via the Alibaba Cloud ICP Filing Management System.

The User Guide section provides a step-by-step overview of the ICP filing process, starting with the preparation stage. It covers key actions such as registering an Alibaba Cloud account for the filing entity, configuring notifications, and verifying that both the domain name and the associated server meet the necessary conditions for filing.

There's also an option to authorize another account to handle the filing process, which can be useful for teams or third-party agents. The documentation lists the required documents for different filing scenarios and emphasizes the importance of understanding regional ICP regulations in mainland China. 
Together, these topics ensure users are properly guided from the initial setup to full compliance.  
The _Support_ section includes an FAQ that addresses common questions, helping to clarify edge cases or resolve typical issues users might encounter during the process.