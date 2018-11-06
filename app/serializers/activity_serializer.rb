class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :snippet, :trip
end
