# # encoding: utf-8

# Inspec test for recipe django::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.
describe command('django-admin --version') do
  its(:stdout) { should match '1.6.11\n' }
end
