Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allLinks, function: Resolvers::SearchLinks
end
