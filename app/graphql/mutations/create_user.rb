module  Mutations
  class CreateUser < BaseMutation
    argument :credentials, Types::AuthProviderCredentialsInput, required: true
    argument :name, String, required: true

    field :user, Types::UserType, null: false

    def resolve(credentials:, name:)
      user = User.new(
        name: name,
        username: credentials[:username],
        password: credentials[:password]
      )
      { user: user } if user.save
      raise GraphQL::ExecutionError, user.errors.full_messages.join(', ')
    end
  end
end