
external_url 'https://gitlab-registry.pd-lab.net'


letsencrypt['enable'] = false
nginx['listen_port'] = 80
nginx['listen_https'] = false

postgresql['shared_buffers'] = "256MB"
sidekiq['max_concurency'] = 4
sidekiq['concurency'] = 1

puma['worker_timeout'] = 120
puma['worker_processes'] = 1 

prometheus_monitoring['enable'] = false

gitlab_rails['omniauth_enabled'] = true
gitlab_rails['omniauth_allow_single_sign_on'] = ['saml']
gitlab_rails['omniauth_sync_email_from_provider'] = 'saml'
gitlab_rails['omniauth_sync_profile_from_provider'] = ['saml']
gitlab_rails['omniauth_sync_profile_attributes'] = ['email']
gitlab_rails['omniauth_auto_sign_in_with_provider'] = 'saml'
gitlab_rails['omniauth_block_auto_created_users'] = false
gitlab_rails['omniauth_auto_link_saml_user'] = true
gitlab_rails['omniauth_providers'] = [
  {
    name: 'saml',
    args: {
      assertion_consumer_service_url: 'https://gitlab.pd-lab.net/users/auth/saml/callback',
      # Shown when navigating to certificates in authentik
      idp_cert_fingerprint: '9c:1f:2b:d9:04:42:eb:40:0b:73:11:c2:84:1b:94:be:91:8d:9f:7b',
      idp_sso_target_url: 'https://authentik.pd-lab.net/application/saml/<authentik application slug>/sso/binding/redirect/',
      issuer: 'https://gitlab.pd-lab.net',
      name_identifier_format: 'urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress',
      attribute_statements: {
        email: ['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress'],
        first_name: ['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'],
        nickname: ['http://schemas.goauthentik.io/2021/02/saml/username']
      }
    },
    label: 'authentik'
  }
]
