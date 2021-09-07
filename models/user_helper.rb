module UserHelper

  USER_ROLES = {
      admin: 'Manager',
      developer: 'Developer',
      reporter: 'Reporter'
  }.freeze

  def user_role_name (role)
    USER_ROLES[role.to_sym] || raise("There is no role for #{role}")
  end
end