# Session Management

Session management involves managing user interactions with a system to ensure security, efficiency, and continuity. It is typically utilized in applications, databases, and web services to control user access and interaction with resources.

## Everest authentication

Everest supports two authentication methods:

- Built-in authentication: Suitable for non-production environments

- [External Identity Provider (IdP) authentication](Idp_integration.md): Suitable for production use and enables integration with systems such as Okta and Azure AD.


### How authentication works in Percona Everest

Everest uses access tokens to authenticate users:

- **Percona Everest authentication (Built-in):**  Percona Everest generates and manages the access tokens.
- **External IdP authentication:** The tokens are issued and controlled by the IdP.

Starting with Percona Everest 1.7.0, the access tokens will now be invalidated in the following scenarios:

- Once the user is logged out. This is applicable for both built-in and IdP.

- Once the user is deleted. This is applicable for built-in users only. The access token for users from an IdP will remain valid until it expires. Therefore, we recommend setting a short expiration period for these access tokens.

!!! info " Important"
    For IdP, we recommend using:

    - Short-lived access tokens (such as 5 minutes)
    - Long-lived refresh tokens
        
    For more details, refer to the [Okta guide](https://developer.okta.com/docs/guides/refresh-tokens/main/) on refresh tokens.
















    
    
  






