Rails.configuration.stripe = {
  :publishable_key => Rails.application.credentials.stripe[:access_key_id],
  :secret_key      => Rails.application.credentials.stripe[:secret_access_key]
}

Stripe.api_key = Rails.application.credentials.stripe[:secret_access_key]
