
1. Please list out the ticket status in the ticket system.
	- Pending response
	- Feedback
	- Processing
	- Pending feedback 
	- To be confirmed
	- Closed
----------
2. What do you need to do for these ticket status?
	- "Pending feedback": This is the initial status of a new ticket submitted by a customer. It indicates that the ticket has entered the queue and is awaiting attention.
	- "Feedback": This status shows that the ticket has been addressed by another engineer or support agent.
		The last two statuses require a prompt response from the ticket owner. 
	- "Processing": This means I have acknowledged the customer's inquiry and responded to let them know I'm working on it. In this stage, I usually consult with the backend team to confirm the best solution. 
	- "Pending feedback": This may indicate that I've requested more information from the customer to proceed with the resolution, or that I have already provided a proposed solution (based on official documentation and backend support) and I'm now waiting for the customer’s confirmation. 
	- "To be confirmed": This status is used when the issue appears to be resolved and I have sent a final reply to the customer, or when the customer has not responded after three follow-up attempts. 
	- "Closed": The issue has been fully resolved and no further assistance is required. This can happen either because the customer closed the ticket themselves or because the system automatically closed it after three days of no response from the customer. 
------------
3. What should you do to the ticket before you off duty? 
	Before I go off duty, I transfer tickets to the appropriate team depending on the issue type (e.g. account, payment, technical). I make sure all necessary information has been provided for proper follow-up. The next day, I review the status of my tickets and continue assisting customers as needed.
------
4. Customer registered an account in Singapore, can he bind a Hong Kong mobile number?
	No. The phone number must match the account's registered region.
----
5. Now the customer is unable to log into the account due to he lost his phone. How should you guide customer?
	Modifying the registered email or phone number requires verification, which depends on the customer's payment method. First, I need to check the payment methods associated with the customer’s account. Once identified, I select the appropriate template from the "Modify Email / Modify Phone Number" lesson. These templates are used to request specific verification information from the customer. After receiving the information, I proceed as follows:
	- If the payment method is Credit Card, PayPal, or Account Balance: Submit an internal YIDA request for modification.
	- <span style="color:red">If the payment method is Quota / Aliyun Credit (typically for end-users): An additional step is required. I contact the relevant Business Development (BD) representative for the distributor customer, create a DingTalk group, and request that BD verify the customer’s identity and submit the YIDA endorsement. </span>
<span style="color:green">
If customer's payment method is quota, it most likely the account type is an EU account (partner account), then you can also straight away to submit a YIDA, in the YIDA process, the handler will let related BD to confirm straight away in the YIDA process, no need to create dingtalk group. Can just follow up the YIDA.
</span>
----
6. What are the payment method that supported to be bound in the account?
	- Bank card 
	- Paypal
	- <span style="color:red"> Paytm </span>
		<span style="color:green">We no longer supported to register account in India region, so that the PayTM is not supported any more.</span>
	- Account balance
	- Credit limit
	Each of these payment methods has its corresponding specifications and terms
---
7. There is a subscription type of ECS instance under account not been released yet, but customer wants to delete the account now. What should you do?
	<span style="color:red"> If a customer wants to delete their account while a subscription-type ECS instance is still active and not yet released, it is essential to provide a clear and friendly reminder:
	Once the account is deleted, all associated services and data — including the active ECS instance — will be permanently removed and cannot be recovered. The customer will also lose access to the Alibaba Cloud console and will no longer be able to log in using that account. 
	Therefore, I must advise the customer to back up all important data in advance, even if the ECS instance has not been released yet. Otherwise, the instance and its contents will be lost once the account is deleted. </span>

	<span style="color:green">According to the system logic, the account can't be deleted if there is existing resource, need to release and the related bill settled. You can check the related document in the account charpter (study material). So the first thing remind customer do the necessary data backup and release the instance. Then try to delete account by customer.  </span>

---
8. Customer has a personal account not been verified, now he wants to change to enterprise account type, what should you do?
	If the personal account has already been verified, the customer can upgrade to an enterprise account directly by submitting the required enterprise information through the console. 
	If the personal account has not been verified, and the customer wants to switch to an enterprise account type, I can generate an upgrade link from the backend system. The customer must then use the main account to complete the necessary information via the provided link. 
	Before sharing the upgrade link, I must remind the customer of the following:
	
	a) Once converted to an enterprise account, the account cannot be switched back to a personal account. 
	b) The modification link is valid for a limited time, typically 3 days.
	c) The main account must be used to complete the upgrade process. 
	There is a suggested response template available in the lesson titled “Personal Account to Enterprise Account"
---
9. Customer wants to create an instance, but with error prompt: Sorry, system detect your payment method is at risk. What should you do?
	Upon receiving this ticket, the first priority is to use the internal tools to check the specific risk control type associated with the customer’s payment method.
	To do this, I retrieve the risk control code using the customer’s UID. Once I have the code, I consult the “List of Risk Control Codes” to understand the nature of the issue. This list not only provides the meaning of each code, but also outlines the appropriate handling procedure.
	For example, if the issue is related to KYC (Know Your Customer) verification, I will follow the recommended process by requesting the necessary information from the customer. In such cases, I use the KYC suggested reply provided in the internal knowledge base to ensure the communication is accurate and compliant.
---
10. I have bound my credit card, when should you return my 1 dollar? 
	<span style="color:red"> 
		Typically it takes one week after the card is successfully bound.
		However, if the customer reports that the amount has not been refunded after more than a week, I can proceed to contact iPay for further consultation and assist the customer accordingly.</span>
	<span style="color:green"> Please escalate issue to L2 consulting team</span>