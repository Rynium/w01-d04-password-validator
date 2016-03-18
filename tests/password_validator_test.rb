require "test_helper"
require_relative "../lib/password_validator.rb"

class PasswordValidatorTest < Minitest::Test
  # We try a password with a valid mix of upper and lower-case characters
  def test_length1
    result = length?("ryanstan")
    assert(result, "'ryanstan' should be valid because it is 8 characters")
  end

  def test_length2
    result = length?("rynie11")
    refute(result, "'rynie11' should be invalid, because it is only 7 characters")
  end

  def test_lower1
    result = lower?("RYANSTANTz")
    assert(result, "RYANSTANTz should be valid because it contains a lower case letter")
  end

  def test_lower2
    result = lower?("RYANSTANTZ")
    refute(result, "RYANSTANTZ should not be valid because it contains zero lower case letters")
  end

  def test_upper1
    result = upper?("RYANSTANTz")
    assert(result, "RYANSTANTz should be valid because it contains a lower case letter")
  end

  def test_upper2
    result = upper?("ryanstantz")
    refute(result, "'ryanstantz' should not be valid because it contains zero lower case letters")
  end

  def test_non_alpha_numeric1
    result = non_alpha_num?("RYANSTANTz18**")
    assert(result, "'RYANSTANTz18**' should be valid because it contains a lower case letter")
  end

  def test_non_alpha_numeric2
    result = non_alpha_num?("ryaNStantz1")
    refute(result, "'ryaNStantz1' should not be valid because it contains zero lower case letters")
  end

  def test_num1
    result = numbers?("RYANSTANTz18**")
    assert(result, "'RYANSTANTz18**' should be valid because it contains a lower case letter")
  end

  def test_num2
    result = numbers?("ryaNStantz**")
    refute(result, "'passwrd1' should not be valid because it contains zero lower case letters")
  end

  def test_contain_password1
    result = contains_password?("passwrd1*")
    assert(result, "'RYANSTANTz18**' should be valid because it contains a lower case letter")
  end

  def test_contain_password2
    result = contains_password?("password1")
    refute(result, "'password1' should not be valid because it contains zero lower case letters")
  end

end
