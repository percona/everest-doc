# Generate CA certificates

If you do not have an existing Certificate Authority (CA), you can create a self-signed CA. The script that is being used here is [CFSSL](https://github.com/cloudflare/cfssl) from Cloudflare:
{.power-number}

## Prerequisites

For Debian.Ubuntu:

- Install CFSSL and CFSSLJSON.

```sh
sudo apt-get install golang-cfssl
```

- For macOS

```sh
brew install cfssl
```

## Generate a Self-Signed CA

```bash
#!/bin/bash
set -e  # Stop execution if any command fails

# ---------------------------------------
# Step 1: Create the CA configuration
# ---------------------------------------
# This file defines the certificate usage and expiry settings.
# Adjust the "expiry" value if you need a longer or shorter validity period.

cat > ca-config.json <<EOF
{
  "signing": {
    "profiles": {
      "ca": {
        "expiry": "8760h",                  # 1 year validity
        "usages": ["cert sign", "digital signature"]
      }
    }
  }
}
EOF

# ---------------------------------------
# Step 2: Generate the Root CA certificate and key
# ---------------------------------------
# This creates:
#   - ca.pem      : CA certificate
#   - ca-key.pem  : CA private key
#   - ca.csr      : Certificate Signing Request
#
# Modify the values below to match your organization or security requirements.

cat <<EOF | cfssl gencert -initca -profile=ca - | cfssljson -bare ca
{
  "CN": "Root CA",
  "names": [
    {
      "O": "PSMDB"                           # Organization Name
    }
  ],
  "key": {
    "algo": "rsa",
    "size": 2048                             # Increase to 4096 for stronger security
  }
}
EOF

# ---------------------------------------
# Step 3: Display certificate details
# ---------------------------------------

echo "Root CA certificate generated successfully:"
openssl x509 -in ca.pem -noout -text
```

??? "What the script does"

    1. Creates a CA configuration file (ca-config.json)

        - Sets the signing profile ca
        - Defines expiry (8760 hours = 1 year)
        - Defines allowed usages:
        - cert sign, digital signature

    2. Generates the CA certificate and key using CFSSL

        - Uses cfssl gencert -initca to initialize a new CA
        - Sets the Common Name to Root CA
        - Sets Organization to PSMDB
        - Creates a 2048-bit RSA key
            - Writes output files:
            - ca.pem — CA certificate
            - ca-key.pem — CA private key
            - ca.csr — certificate signing request













 







