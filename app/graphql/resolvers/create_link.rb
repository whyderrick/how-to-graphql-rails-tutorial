class Resolvers::CreateLink < GraphQL::Function
  argument :description, !types.String
  argument :url, !types.String

  # mutation return type
  type Types::LinkType

  def call(_obj, args, context)
    Link.create!(
      description: args[:description],
      url: args[:url],
      user: context[:current_user]
    )
  end
end
