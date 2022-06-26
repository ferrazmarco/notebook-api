class Contact < ApplicationRecord
  belongs_to :type

  def as_json(_options = {})
    super(
      root: true,
      methods: :type_description,
    )
  end

  def type_description
    type.description
  end
end