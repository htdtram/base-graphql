module Types
  class StudentType < Types::BaseObject
    implements UserInterface
    field :class_name, String, null: false
  end
end
