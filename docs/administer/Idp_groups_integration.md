# RBAC: IdP groups integration

You can now assign RBAC policies to user groups obtained from the external IDP. This change simplifies permissions management for external users without the need for unique sub IDs.

A user will be authorized to perform an operation if either their subject or any of the groups they belong to has the required permission. To use IdP groups in Percona Everest RBAC, you would need to set up the groups claim in your IdP provider configuration.

## OKTA

Let's consider you have successfully set up an Identity Provider (IdP) [integration with Okta](Idp_integration.md#configure-oidc-on-the-provider-side). In this configuration, the issuer URL identifies your API server, which acts as a unique identifier for your server within Okta. Additionally, you will have a client application, referred to as the Application integration, which is represented by the client ID. This setup allows for secure communication and authentication between your application and Okta's services.
{.power-number}

1. Navigate to **Security > API**.

2. In the list, find the API server that you use and click **Edit**.

3. **Click Scopes > Add Scope**. 

    !!! note
        A Scope describes the information that potentially can be requested.  
    
    Add a scope called **groups** and keep all other options set to their default values.

    ![!image](../images/scr_scope.png)

4. **Click Claims > Add Claim**. 

    !!! note
        A claim specifies the scope to activate and the information required within that scope.

    1. Add a claim named **groups**.

    2. Set the **Include in token type** to **ID Token** and choose **Always**.

    3. Change the **Value type** to **Groups**.

    4. Select **Filter** as  **Matches regexp** and add a filter to match the desired Okta groups for Everest, for example: .*.

    5. Set **Include in** to **groups**, which is the scope you created earlier.

    ![!image](../images/scr_claim.png)

5. Click **Create**.

6. Click **Access Policies > Add Policy**. A policy restricts how this authorization server is used.

    1. Add **Name** and **Description**.

    2. Assign the policy to the client (Application Integration) you created earlier. The field should auto-complete as you type. Create the policy.

    3. Create the policy.

    ![!image](../images/scr_policy.png)

6. Add a rule to the policy. A Rule defines the details of usage:

    1. Add a name. If you prefer, you can use **default** option.

    2. Fine-tune the settings to align with your organization's security policy. Here are some suggestions:

        - Uncheck all grant types except for the **Authorization Code**.
        -  Adjust the token lifetime to determine how long a session can remain active.
        - Restrict the refresh token lifetime or consider deactivating it completely.

    ![!image](../images/scr_rule.png)

7. Click **Create Rule**.


## Configure Group claims in OKTA

During the SSO authentication, if the group's scope is requested but the Identity Provider (IdP), like Okta, lacks the necessary groups claim configuration or does not support it by default, SSO could fail or not function as expected.


To retrieve the OIDC groups, users must include the scope by specifying the following fields:

`--scopes openid,profile,email,groups`

  where:

   `**scopes openid**` - Grants access to the user’s identity and required for OpenID Connect authentication


   `**profile**` - Grants access basic profile information


   `**email**` - Grants access to the user's email address and its verification status 


   `**groups**` - Grants access to obtain information about the user's group memberships





































