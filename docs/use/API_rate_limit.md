# API rate limiting


API rate limiting is a crucial aspect of managing APIs effectively. It involves setting a threshold for the number of requests that an API can receive within a specific period. This enables you to regulate the number of incoming requests, mitigating the risk of server overload or abuse. 


## Sessions rate limit

The Everest API has a critical endpoint known as the `/session` endpoint, which is responsible for exchanging the user's login credentials (username and password) for a JSON web token (JWT). As this endpoint is critical to safeguarding the user's integrity and confidentiality, it is important to implement additional security measures.

By default, an Percona Everest installation allows three requests per second to this endpoint. It’s configurable via the `CREATE_SESSION_RATE_LIMIT` environment variable.

Everest monitors failed login attempts per IP address and applies progressive timeouts to prevent unlimited login attempts without being throttled. When a rate limit is reached, the Percona Everest API will throw an error.

  
## Customize API rate limiting

The default rate limit for Percona Everest is 100 requests per second. However, you have the option to modify these limits. To customize API rate limiting, you can adjust the rate limits to align them with your usage patterns and requirements.

For example, when dealing with large systems that have many database clusters, the default limit of 100 may not be sufficient, and therefore, you might want to increase the limit.

Customizing API rate limiting is crucial for the following reasons:

- Attackers can launch brute force attacks on Auth Bearer Tokens by submitting a high volume of automated requests if rate limiting is not applied. Successful brute force attacks may compromise user credentials or sensitive information associated with the Auth Bearer Tokens.

- The influx of excessive requests can overload the application server, using up bandwidth and storage.


To customize the API rate limiting:
{.power-number}

1. Run the following command:

    ```
    kubectl -n everest-system patch deployment percona-everest --type strategic -p 'spec:
      strategy:
        rollingUpdate:
          maxSurge: 0
          maxUnavailable: 1
        type: RollingUpdate
      template:
        spec:
          affinity:
            podAntiAffinity: {}
          containers:
            - name: everest
              env:
                - name: API_REQUESTS_RATE_LIMIT
                  value: "200"' 
                  - name: CREATE_SESSION_RATE_LIMIT
              value: "3"' 
    ```

    Replace 200 with the desired value.

2. After executing the previous command, `percona-everest` pod will restart automatically. If you had port-forwarding running, it would exit, and you'll need to rerun it.

      ```
      kubectl port-forward svc/everest 8080:8080 -n everest-system
      ```








