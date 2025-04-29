# TLS support for Percona Everest

The Percona Everest server now supports Transport Layer Security (TLS)  for all incoming connections. TLS **encrypts** client and server communication. This keeps data safe from being **intercepted or changed**. Administrators can configure server certificates and private keys to enable **secure HTTPS access** to the Everest API server. This strengthens security for production environments.

!!! note
    - When TLS is enabled, the default server port (8080) will only accept `https` traffic, and `http` traffic will be rejected.
    - We do not support redirects from `http` to `https`.
    - Self-signed certificates aren't trusted by most browsers, so it's best to use a trusted certificate from a Certificate Authority (CA) in production.



## TLS setup with Percona Everest

!!! info "Important"
    This section provides an example using **Helm**. You can also use the provided options with `everestctl` by using the flag `—helm.set`.


### Use Cert-manager (recommended)     

#### Pre-requisites

- Ensure that [cert-manager](https://cert-manager.io/docs/) has been deployed in your infrastructure.

- Ensure that you have a properly configured **Issuer** or **ClusterIssuer** in place. See the [documentation](https://cert-manager.io/docs/configuration/) for details.


#### Set up Percona Everest using cert-manager

Here are the steps to set up the Percona Everest server using cert-manager:
{.power-number}

1. Install cert-manager:

    ```sh
    kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.17.0/cert-manager.yaml
    ```

2. Create a Self-Signed issuer.

    Use the following YAML configuration:

    ```sh
    apiVersion: cert-manager.io/v1
    kind: ClusterIssuer
    metadata:
        name: test-selfsigned
    spec:
        selfSigned: {}
    ```
  
    This will create a `ClusterIssuer` named `test-selfsigned ` that can issue certificates using a self-signed method, without the need for an external Certificate Authority (CA).

    !!! note
        Self-signed issuers are not recommended for production use. We are using a self-signed issuer for simplicity. You can configure additional types of issuers; see the [documentation](https://cert-manager.io/docs/configuration/issuers/) for details.

3. Create a configuration file named `values.yaml`:

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

    Replace **example.com** with your actual domain name. The certificate will be issued by the `test-selfsigned` issuer created earlier.


4. Install Percona Everest in the `everest-system` namespace:

    ```sh
    helm install everest-core percona/everest --create-namespace \
	-n everest-system \
	--set server.tls.enabled=true \
	-f values.yaml
    ```


??? info "Alternative TLS options to set up Percona Everest"

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

        Replace `YOUR_PRIVATE_KEY_FILE` and `YOUR_CERTIFICATE_FILE` with the actual paths to your key and certificate files.

    3. Install Percona Everest with your custom certificates:

        ```sh
        helm install everest-core percona/everest --create-namespace \
        -n everest-system \
        --set server.tls.enabled=true \
        -f values.yaml
        ```





























    
    
  






