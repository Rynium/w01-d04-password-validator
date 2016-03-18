require "pry"

def length?(password)
  password.length >= 8
end

def lower?(password)
  password.gsub(/[a-z]/, '') != password
end

def upper?(password)
  password.gsub(/[A-Z]/, '') != password
end

def non_alpha_num?(password)
  password.gsub(/[^a-zA-Z0-9]/, "") != password
end

def numbers?(password)
  password.gsub(/[0-9]/, "") != password
end

def contains_password?(password)
  password.gsub(/password/i, "") == password
end
