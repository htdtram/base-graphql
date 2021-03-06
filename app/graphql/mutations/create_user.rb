module  Mutations
  class CreateUser < BaseMutation
    argument :credentials, Types::AuthProviderCredentialsInput, required: true
    argument :information, Types::InformationInput, required: true
    argument :role, Types::RoleEnum, required: true

    field :user, Types::UserType, null: false

    def resolve(credentials:, information:, role:)
      # current_user = ::Services::AuthorizeRequest.authentication(context)
      # if current_user.admin?
        user = User.new(
          username: credentials[:username],
          password: credentials[:password],
          name: information[:name],
          gender: information[:gender],
          birthday: information[:birthday],
          role: role
        )

        return { user: user } if user.save

        raise GraphQL::ExecutionError, user.errors.full_messages.join(', ')
      # else
        # raise GraphQL::ExecutionError, 'Permission denied'
      # end
    end
  end
end
