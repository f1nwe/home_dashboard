# frozen_string_literal: true

# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server '192.168.0.8', user: 'f1nwe', roles: %w[app]

set :branch, 'main'
