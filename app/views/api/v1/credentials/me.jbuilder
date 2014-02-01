json.(@me, :email)
json.identities @me.identities do |identity|
    json.provider identity.provider
    json.access_token identity.access_token
end
