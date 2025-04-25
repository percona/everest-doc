# Session Management

Session management is the process of handling user sessions to keep them secure, efficient, and continuous. It is used in applications that manage user authentication and authorization, such as web services, databases, and DBaaS platforms.

## Percona Everest authentication methods

Percona Everest supports two authentication methods:

- Built-in authentication: Suitable for non-production environments

- [External Identity Provider (IdP) authentication](Idp_integration.md): Suitable for production use and enables integration with systems such as Okta and Azure AD.


## How authentication works in Percona Everest

Everest uses access tokens to authenticate users:

- **Built-in authentication:**  Percona Everest generates and manages the access tokens directly.
- **External IdP authentication:** The tokens are issued and controlled by the IdP.

Starting with Percona Everest 1.7.0, the access tokens will **now be invalidated** in the following scenarios:

- Once the user has logged out, this applies to both the built-in system and IdP.


- Once a user is deleted, this only applies to built-in users. The access token for users from an IdP will remain valid until it expires, so we recommend setting a short expiration period for these access tokens.

!!! info " Important"
    For IdP, we recommend using:

    - Short-lived access tokens (such as 5 minutes)
    - Long-lived refresh tokens
        
    For more details, refer to the [Okta guide](https://developer.okta.com/docs/guides/refresh-tokens/main/) on refresh tokens.
















    
    
  






