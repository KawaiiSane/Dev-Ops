secrete(basa64 encoded) are used to store the important to store login details, ssh keys, etc.

Types:
1. Opaque(key-value)
2. basic(user-password)
3. ssh 
4. tls certificates
5. docker registry
7. K8s token 

secrets are not encrypted they are encoded means you `dont need a private key` to decrypt it. instead they have base64 encoding 