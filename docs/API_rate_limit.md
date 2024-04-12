# API rate limiting


API rate limiting is a crucial aspect of managing APIs effectively. It involves setting a threshold for the number of requests that an API can receive within a specific period. This enables you to regulate the number of incoming requests, mitigating the risk of server overload or abuse. 

The default rate limit for Percona Everest is 100 requests per second. However, you have the option to modify these limits. To customize API rate limiting, you can adjust the rate limits to align them with your usage patterns and requirements.

Customizing API rate limiting is crucial for the following reasons:

-  Attackers can launch brute force attacks on Auth Bearer Tokens by submitting a high volume of automated requests if rate limiting is not applied. Successful brute force attacks may compromise user credentials or sensitive information associated with the Auth Bearer Tokens.

- The influx of excessive requests can overload the application server, using up bandwidth and storage.





