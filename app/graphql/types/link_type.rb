Types::LinkType = GraphQL::ObjectType.define do
  name "Link"

  field :id, !types.ID
  field :url, !types.String
  field :descriptions, !types.String

  field :postedBy, -> { Types::UserType }, property: :user
end
