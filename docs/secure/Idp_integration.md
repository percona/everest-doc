Percona Everest IdP integration

[Identity Provider (IdP)](https://www.okta.com/identity-101/why-your-company-needs-an-identity-provider/) integration connects applications and services with an external identity provider for your organization. This enables centralized authentication and authorization management, improving security and simplifying user access. By leveraging IdP integration, you can ensure that users are securely authenticated and authorized to access various applications and services across your organization.

Percona Everest uses [OpenID Connect](https://auth0.com/docs/authenticate/protocols/openid-connect-protocol)(OIDC) Protocol to integrate with external Identity Providers (IdP).


## Configure OIDC on the providers's side

When setting up the Provider side, it's important to configure an application specifically for [PKCE]((https://auth0.com/docs/get-started/authentication-and-authorization-flow#authorization-code-flow-with-proof-key-for-code-exchange-pkce-)) (Proof Key for Code Exchange) authorization.

    !!! info "Important"
        The login redirect URL should point to `<EVEREST_URL>/login-callback`, and the  logout redirect URL `- to <EVEREST_URL>`.







