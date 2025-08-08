defmodule Superdupernova.TestAccounts do
  use Ash.Domain, extensions: [AshPhoenix.Domain]

  resources do
    resource Superdupernova.Accounts.TestUser
    resource Superdupernova.Accounts.Address
  end
end