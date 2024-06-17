# Percona Everest IdP integration

[Identity Provider (IdP)](https://www.okta.com/identity-101/why-your-company-needs-an-identity-provider/) integration connects applications and services with an external identity provider for your organization. This enables centralized authentication and authorization management, improving security and simplifying user access. By leveraging IdP integration, you can ensure that users are securely authenticated and authorized to access various applications and services across your organization.

Percona Everest uses [OpenID Connect](https://auth0.com/docs/authenticate/protocols/openid-connect-protocol)(OIDC) Protocol to integrate with external Identity Providers (IdP).


## Configure OIDC on the providers's side

- **PKCE**: When setting up the Provider side, it's important to configure an application specifically for [PKCE]((https://auth0.com/docs/get-started/authentication-and-authorization-flow#authorization-code-flow-with-proof-key-for-code-exchange-pkce-)) (Proof Key for Code Exchange) authorization.

    !!! info "Important"
        The login redirect URL should point to `<EVEREST_URL>/login-callback`, and the logout redirect URL to `<EVEREST_URL>`.

- **https based**: IdP providers often require the use of a secure connection (https). Therefore, the provider might require your `<EVEREST_URL>` to be based on https.

- **Issuer URL**: The created OIDC Application will have a `client ID` field, which can be used for the Everest configuration. The issuer URL can be found in your provider's Authorization Servers list.

??? example "Example: OKTA"

    1. Sign in to your Okta organization as a user with administrative privileges.
    
    2. In the **Admin** Console, go to **Applications → Applications** and click **Create App Integration**.

    3. On the **Create a new app integration page**, set the following:
    
        - Select **OIDC - OpenID Connect** as the Sign-in method 
        - **Web Application** as the Application type, and click **Next**.

        ![!image](../images/OKTA_admin_console.png)

    4. Set the following fields:

        a. App integration name - any value

        b. Sign-in redirect URIs - `<EVEREST_URL>/login-callback`

        c. Sign-out redirect URIs - `<EVEREST_URL>`
        
        d. Click **Save**.

        ![!image](../images/sso_aap_integration.png)

        !!! note "Note"
            Okta allows the use of HTTP for development purposes and in cases where the Admin explicitly permits it.

        e. Copy the `clientID` of the created app.
        f. Navigate to **Security → API → Authorization Servers** and copy the `issuerURL` you’d like to use for the Everest authorization. 






