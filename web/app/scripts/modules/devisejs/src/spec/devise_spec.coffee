assert = require 'assert'
devise = require '../../build/devise.min'

admin =
  email: "admin@example.com"
  roles_mask: 1

user =
    email: "user@example.com"
    roles_mask: 2

userAndModerator =
  email: "userandmoderator@example.com"
  roles_mask: 6

roles = [
  'admin'
  'user'
  'moderator'
  'author'
]

describe 'devise', ->
  it 'can determine a user is not a non existent role', ->
    devise.loadRoles(roles)
    devise.loadCurrentUser(user)
    expect(devise.currentUser().isRole('non-existent-role')).toBe(false)

  # User
  it 'can determine a user does not have a role they do not belong to', ->
    devise.loadRoles(roles)
    devise.loadCurrentUser(user)
    expect(devise.currentUser().isRole('admin')).toBe(false)

  it 'can determine a user has a role', ->
    devise.loadRoles(roles)
    devise.loadCurrentUser(user)
    expect(devise.currentUser().isRole('user')).toBe(true)

  # User and Moderator
  it 'can determine a user/moderator does not have an admin role', ->
    devise.loadRoles(roles)
    devise.loadCurrentUser(userAndModerator)
    expect(devise.currentUser().isRole('admin')).toBe(false)

  it 'can determine a user/moderator has a user role', ->
    devise.loadRoles(roles)
    devise.loadCurrentUser(userAndModerator)
    expect(devise.currentUser().isRole('user')).toBe(true)

  it 'can determine a user/moderator has a moderator role', ->
    devise.loadRoles(roles)
    devise.loadCurrentUser(userAndModerator)
    expect(devise.currentUser().isRole('moderator')).toBe(true)

  # Admin
  it 'can determine an admin really is an admin', ->
    devise.loadRoles(roles)
    devise.loadCurrentUser(admin)
    expect(devise.currentUser().isRole('admin')).toBe(true)



