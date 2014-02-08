class Aggregate
  @model_name = 'Aggregate'

  def self.all(abilities)
    all = {
      abilities: abilities,
      roles: User.valid_roles,
      links: Link.all
    }

    all
  end
end
