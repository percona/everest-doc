# TLS support for Percona Everest

Percona Everest can be configured to use Transport Layer Security (TLS) for all incoming connections to the Everest API server. TLS ensures that communication between clients and the API server is encrypted, protecting data from interception or tampering. Administrators can configure server certificates and private keys to enable **secure HTTPS access**, enhancing the overall security posture for production environments.

!!! note
    - When TLS is enabled, the default server port (8080) will only accept `https` traffic, and `http` traffic will be rejected.
    - We do not support redirects from `http` to `https`.
    - Self-signed certificates aren't trusted by most browsers, so it's best to use a trusted certificate from a Certificate Authority (CA) in production.



## TLS setup with Percona Everest

!!! info "Important"
    This section provides an example using **Helm**. You can also use the provided options with `everestctl` by using the flag `--helm.set`.


### Use Cert-manager (recommended)     

#### Prerequisites

- Ensure that [cert-manager](https://cert-manager.io/docs/){:target="_blank"} has been deployed in your infrastructure.

- Ensure that you have a properly configured **Issuer** or **ClusterIssuer** in place. See the [documentation](https://cert-manager.io/docs/configuration/){:target="_blank"} for details.


#### Set up Percona Everest using cert-manager

Here are the steps to set up the Percona Everest server using cert-manager:
{.power-number}


1. Create a configuration file named `values.yaml`:

    ```sh
    server:
	tls: 
	  enabled: true
	  certificate:
	  create: true
	  domain: example.com
	  issuer:
			group: cert-manager.io
			kind: ClusterIssuer 
			name: your-cluster-issuer
    ```

    Replace **example.com** with your actual domain name.


2. Install Percona Everest using the above values:

    ```sh
    helm install everest-core percona/everest --create-namespace \
	-n everest-system \
	--set server.tls.enabled=true \
	-f values.yaml
    ```


??? info "Alternative methods for configuring TLS in Percona Everest"

    ### Use self-signed certificates

    Use self-signed certificates (automatically generated during installation):
     

    ```sh
    helm install everest-core percona/everest --create-namespace \
	-n everest-system \
	--set server.tls.enabled=true
    ```

    ### Configure TLS with custom certificates

    Here are the steps to set up the Percona Everest server using custom certificates:
    {.power-number}

    1. Prepare your certificate public key (`tls.crt`) and private key (`tls.key`) files. 

    2. Create a configuration file named `values.yaml`:

        ```sh
        server:
        tls: 
           enabled: true
           secret:
                certs:
                    tls.key: YOUR_PRIVATE_KEY_FILE
                    tls.crt: YOUR_CERTIFICATE_FILE
        ```

        Replace `YOUR_PRIVATE_KEY_FILE` and `YOUR_CERTIFICATE_FILE` with the actual contents of your public and private key files.

    3. Install Percona Everest with the following values:

        ```sh
        helm install everest-core percona/everest --create-namespace \
        -n everest-system \
        --set server.tls.enabled=true \
        -f values.yaml
        ```





























    
    
  






