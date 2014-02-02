development
===========

livehq development

# Start development servers

foreman start

# Git commands

git subtree pull --prefix web git@github.com:livehq/web.git master --squash
git subtree pull --prefix api git@github.com:livehq/api.git master --squash
