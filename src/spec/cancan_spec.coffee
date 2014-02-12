assert = require 'assert'
global[k] = v for k,v of require '../../build/cancan.min'

test =
  abilities:
    user:
      id: 3
      email: "test@gmail.com"
      created_at: "2014-02-02T05:15:05.904Z"
      updated_at: "2014-02-06T20:59:05.409Z"
      roles_mask: 2

    rules: [
      {
        match_all: false
        base_behavior: true
        actions: ["read"]
        subjects: [
          model_name: "User"
          parent_name: null
        ]
        conditions: {}
        block: null
      }
      {
        match_all: false
        base_behavior: true
        actions: ["read"]
        subjects: [
          model_name: "User"
          parent_name: null
        ]
        conditions: {}
        block: null
      }
    ]

describe 'cancan', ->
  it 'can when has permission to read model', ->
    loadAbilities(test.abilities)
    expect(can('read', 'User')).toBe(true)
    expect(cannot('read', 'User')).toBe(false)

  it 'cannot when does not have permission', ->
    loadAbilities(test.abilities)
    expect(can('read', 'NonExistentModel')).toBe(false)

