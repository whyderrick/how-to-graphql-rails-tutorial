class Resolvers::SignInUser < GraphQL::Function
  argument :email, !Types::AuthProviderEmailInput

  # Defines inline return type for mutation
  type do
    name "SigninPayload"

    field :token, types.String
    field :user, Types::UserType
  end

  def call(_object, args, context)
    input = args[:email]

    # crude validation
    return unless input

    user = User.find_by(email: input[:email])

    # valdiate credentials if user found
    return unless user
    return unless user.authenticate(input[:password])

    # use ActiveSupport encryptor to build a token
    crypt = ActiveSupport::MessageEncryptor.new(
      Rails.application.secrets.secret_key_base.byteslice(0..31)
    )
    token = crypt.encrypt_and_sign("user-id:#{user.id}")

    context[:session][:token] = token

    OpenStruct.new({ user: user, token: token })
  end
end
