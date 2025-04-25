# Session Management

Session management involves managing user interactions with a system to ensure security, efficiency, and continuity. It is typically utilized in applications, databases, and web services to control user access and interaction with resources.

## Everest authentication

Everest supports two authentication methods:

- Built-in authentication: Suitable for non-production environments

- [External Identity Provider (IdP) authentication](Idp_integration.md): Suitable for production use and enables integration with systems such as Okta and Azure AD.


### How authentication works in Percona Everest

Everest uses access tokens to authenticate users:

- **Percona Everest authentication:**  Percona Everest generates and manages the access tokens.
- **External IdP authentication:** The tokens are issued and controlled by the IdP.




















    
    
  






