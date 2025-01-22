# RBAC: IdP groups integration

You can now assign RBAC policies to user groups obtained from the external IDP. This change simplifies permissions management for external users without the need for unique sub IDs.

A user will be authorized to perform an operation if either their subject or any of the groups they belong to has the required permission. To use IdP groups in Percona Everest RBAC, you would need to set up the groups claim in your IdP provider configuration.

## OKTA

Let's consider you have successfully set up an Identity Provider (IdP) [integration with Okta](Idp_integration.md#configure-oidc-on-the-provider-side). In this configuration, your API server is identified by the issuer URL, which acts as a unique identifier for your server within Okta. Additionally, you will have a client application, referred to as the Application integration, which is represented by the client ID. This setup allows for secure communication and authentication between your application and Okta's services.
{.power-number}

1. Navigate to **Security > API**.

2. In the list, find the API server that you use and click on **Edit**.

3. **Click Scopes > Add Scope**. 

    !!! note
        A Scope describes the information that potentially can be requested.  
    
    Add a scope called **Groups** and keep all other options set to their default values.

4. **Click Claims > Add Claim**. 

    !!! note
        A claim specifies the scope to activate and the information required within that scope.

    a. Add a claim named **Groups**.

    b. Set the **Include in token type** to **ID Token** and choose **Always**.

    c. Change the **Value type** to **Groups**.

    d. Select **Filter > Matches regexp** and add a filter to match the desired Okta groups for Everest, for example: .*.

    e. Set **Include in** to **Groups**, which is the scope you created earlier.

5. Click **Access Policies > Add Policy**. A policy restricts how this authorization server is used.

    a. Add a name and description.

    b. Assign the policy to the client (Application Integration) you created earlier. The field should auto-complete as you type. Create the policy.

    c. Create the policy.

6. Add a rule to the policy. A Rule defines the details of usage:

    a. Add a name. If you prefer, you can use **default**, which is a reasonable option.

    b. Fine-tune the settings to align with your organization's security posture. Here are some suggestions:

     - Uncheck all grant types except for the Authorization Code.
     -  Adjust the token lifetime to determine how long a session can remain active.
    - Restrict the refresh token lifetime or consider disabling it entirely.






































