require "test_helper"
require_relative "../lib/password_validator.rb"

class PasswordValidatorTest < Minitest::Test
  # We try a password with a valid length
  def test_length1
    result = length?("ryanstan")
    assert(result, "'ryanstan' should be valid because it is 8 characters")
  end

  # We try a password with an invalid length
  def test_length2
    result = length?("rynie11")
    refute(result, "'rynie11' should be invalid, because it is only 7 characters")
  end

  # We try a password with an invalid mix of upper and lower-case characters
  def test_lower3
    result = lower?("RYANSTANTz")
    assert(result, "'RYANSTANTz' should be valid because it contains a lower case letter")
  end

  # We try a password with an invalid mix of upper and lower-case characters
  def test_lower4
    result = lower?("RYANSTANTZ")
    refute(result, "'RYANSTANTZ' should not be valid because it doesn't contain lower case letters")
  end

  # We try a password with a valid mix of upper and lower-case characters
  def test_upper5
    result = upper?("RYANSTANTz")
    assert(result, "'RYANSTANTz' should be valid because it contains an upper case letter")
  end

  #We try a password with an invalid mix of upper and lower-case characters
  def test_upper6
    result = upper?("ryanstantz")
    refute(result, "'ryanstantz' should not be valid because it doesn't contain an upper case letter")
  end

  #We try a password with a valid mix of non-alpha-numeric characters
  def test_non_alpha_numeric7
    result = non_alpha_num?("RYANSTANTz18**")
    assert(result, "'RYANSTANTz18**' should be valid because it contains a non-alpha-numeric character")
  end

  #We try a password with an invalid mix of non-alpha-numeric characters
  def test_non_alpha_numeric8
    result = non_alpha_num?("ryaNStantz1")
    refute(result, "'ryaNStantz1' should not be valid because it should be valid because it does not contain a non-alpha-numeric character")
  end

  #We try a password with a valid mix of numeric characters
  def test_num9
    result = numbers?("RYANSTANTz18**")
    assert(result, "'RYANSTANTz18**' should be valid because it contains a number")
  end

  #We try a password with an invalid mix of numeric characters
  def test_num10
    result = numbers?("ryaNStantz**")
    refute(result, "'ryaNStantz**' should not be valid because it does not contain a number")
  end

  #We try a password with a valid absence of 'password'
  def test_contain_password11
    result = contains_password?("passwrd1*")
    assert(result, "'passwrd1*' should be valid because it doesn't contain 'password'")
  end

  #We try a password with an invalid instance of 'password'
  def test_contain_password12
    result = contains_password?("password1")
    refute(result, "'password1' should not be valid because it contains 'password'")
  end

  #We try a password with a valid absence of a 3 letter/number sequence
  def test_sequence_valid13
    result = contains_password?("passwrd12*")
    assert(result, "'passwrd12*' should be valid because it doesn't contain a sequence")
  end

  #We try a password with an invalid 3 letter/number sequence
  def test_seqence_valid14
    result = contains_password?("password1")
    refute(result, "'passwrd123*' should not be valid because it contains a sequence")
  end

  #We try a password with a valid combination of characters.
  def test_sequence_valid15
    result = engine("Trump12%")
    assert(result, "'Trump12%' should be valid because it contains caps, lowers, numbers and non-alpha-numerics.")
  end

  #We try an invalid password without any upper case letters.
  def test_seqence_valid16
    result = engine("trump12%")
    refute(result, "'trump12%' should not be valid because it does not contain upper case letters.")
  end

  #We try an invalid password without any upper case letters.
  def test_seqence_valid17
    result = engine("TRUMP12%")
    refute(result, "'TRUMP12%' should not be valid because it does not contain lower case letters.")
  end

  #We try an invalid password without any upper case letters.
  def test_seqence_valid18
    result = engine("Trump1%")
    refute(result, "'Trump1%' should not be valid because it is too short in length.")
  end

  #We try an invalid password that contains the phrase password.
  def test_seqence_valid19
    result = engine("TrumppasswORd12%")
    refute(result, "'Trump1%' should not be valid because it contains password.")
  end

  #We try an invalid password without any upper case letters.
  def test_seqence_valid20
    result = engine("DonTrump%")
    refute(result, "'DonTrump%' should not be valid because it is too short in length.")
  end

  #We try an invalid password that contains a sequence.
  def test_seqence_valid21
    result = engine("Trump123%")
    refute(result, "'Trump123%' should not be valid because it contains a sequence.")
  end
end
