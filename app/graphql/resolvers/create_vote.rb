class Resolvers::CreateVote < GraphQL::Function
  argument :linkId, !types.ID

  type Types::VoteType

  def call(_obj, args, context)
    link = Link.find_by(id: args[:linkId])

    Vote.create!(
      link: link,
      user: context[:current_user],
    )
  end
end
