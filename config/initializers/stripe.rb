Rails.configuration.stripe = {
  :publishable_key => Rails.application.credentials.access_key_id,
  :secret_key      => Rails.application.credentials.secret_access_key
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
