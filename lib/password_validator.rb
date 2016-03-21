require "pry"


#tests for password length
#takes in password, a string, as a parameter
#returns true if password is a valid length
def length?(password)
  password.length >= 8
end

#tests password for lower case letters
#takes the parameter password, a string, and removes all lower case letters (if there are any) & compares with the original password.
#if there are lower case letters, the 'gsub' password should not be equal to the original, and this method should return true(valid),
def lower?(password)
  password.gsub(/[a-z]/, '') != password
end

#tests password for upper case letters
#takes in password, a string, as a parameter and removes all upper case letters (if there are any) then compares with the original password.
#returns true if password contains upper case letters.
def upper?(password)
  password.gsub(/[A-Z]/, '') != password
end

#tests password for non-alpha-numeric characters
#takes in password, a string, as a parameter and removes all non-alpha-numeric characters case letters (if there are any) then
  #compares with the original password.
#returns true if password contains non-alpha-numeric characters.
def non_alpha_num?(password)
  password.gsub(/[^a-zA-Z0-9]/, "") != password
end

#tests password for numbers
#takes in password, a string, as a parameter and removes all numbers (if there are any) then compares with the original password.
#returns true if password contains numbers.
def numbers?(password)
  password.gsub(/[0-9]/, "") != password
end

#tests password for the string 'password'
#takes in password, a string, as a parameter and removes all case-insensitive instances of the word password (if there are any) then
  #compares with the original password.
#returns true if password contains 'password'.
def contains_password?(password)
  password.gsub(/password/i, "") == password
end

#tests password for runs like 'abc' or '123'
#takes in password, a string, as a parameter and iterates through all letters. It compares the start letter and next two letters in the password
  #the next two letters in the alphabet or the orignal number and the next two numbers.
#returns true if password contains upper case letters.
def seqence_valid?(password)
  i = 0
  no_sequence = true
  while i < (password.length - 2) && no_sequence
    sequence1 = (password[i] + password[i+1] + password[i+2]).downcase
    sequence2 = (password[i] + password[i].next + password[i].next.next).downcase

    no_sequence = false if sequence1 == sequence2
    i+=1
  end
  no_sequence
end

#tests for valid password by running through all tests.
#takes in password, a string, as a parameter runs it through all password tests.
#if any validation test returns true, the entire '&&' will return false.
def engine(password)
  length?(password)&&
  lower?(password)&&
  upper?(password)&&
  non_alpha_num?(password)&&
  numbers?(password)&&
  contains_password?(password)&&
  seqence_valid?(password)
end
