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
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join('')}")
  end
end
