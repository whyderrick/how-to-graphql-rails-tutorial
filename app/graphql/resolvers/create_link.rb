class Resolvers::CreateLink < GraphQL::Function
  argument :description, !types.String
  argument :url, !types.String

  # mutation return type
  type Types::LinkType

  def call(_obj, args, _context)
    Link.create!(
      description: args[:description],
      url: args[:url],
    )
  end
end
