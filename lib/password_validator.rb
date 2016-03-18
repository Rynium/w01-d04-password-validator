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

def seqence_valid?(password)
  i = 0
  while i < (password.length - 2)
    sequence1 = (password[i]+password[i+1]+password[i+2]).downcase
    sequence2 = (password[i] + password[i].next + password[i].next.next).downcase
    return false if sequence1 == sequence2
    i+=1
  end
  true
end

def engine(password)
  length?(password)&&
  lower?(password)&&
  upper?(password)&&
  non_alpha_num?(password)&&
  numbers?(password)&&
  contains_password?(password)&&
  seqence_valid?(password)
end
