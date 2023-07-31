=begin
    Rotational Cipher
One simple way to encrypt a string is to "rotate" every alphanumeric character by a certain amount. Rotating a character means replacing it with another character that is a certain number of steps away in normal alphabetic or numerical order.
For example, if the string "Zebra-493?" is rotated 3 places, the resulting string is "Cheud-726?". Every alphabetic character is replaced with the character 3 letters higher (wrapping around from Z to A), and every numeric character replaced with the character 3 digits higher (wrapping around from 9 to 0). Note that the non-alphanumeric characters remain unchanged.
Given a string and a rotation factor, return an encrypted string.
Signature
string rotationalCipher(string input, int rotationFactor)
Input
1 <= |input| <= 1,000,000
0 <= rotationFactor <= 1,000,000
Output
Return the result of rotating input a number of times equal to rotationFactor.
Example 1
input = Zebra-493?
rotationFactor = 3
output = Cheud-726?
Example 2
input = abcdefghijklmNOPQRSTUVWXYZ0123456789
rotationFactor = 39
output = nopqrstuvwxyzABCDEFGHIJKLM9012345678

=end


def rotational_cipher(my_input, k) 
    output = ''
    my_input.each_char do |c|
      # if it is a number
      ascii_c = c.ord
      o = ''
      if ascii_c >= 48 && ascii_c <= 57
        num = (k % 10) 
        if ascii_c + num > 57 
          o = ((ascii_c + num - 57) +  47).chr 
        else
          o = (ascii_c + num).chr
        end
        output += o
      
      # if it is a capital letter
      elsif ascii_c >= 65 && ascii_c <= 90
        small = (k % 26)
        if ascii_c + small > 90
          o = ((ascii_c + small - 90) + 64).chr
        else
          o = (ascii_c + small).chr
        end
        output += o
      # if it is a small case letter
      elsif ascii_c >= 97 && ascii_c <= 122
        large = (k % 26)
        if ascii_c + large > 122
          o = ((ascii_c + large - 122) + 96).chr
        else
          o = (ascii_c + large).chr
        end
        output += o
      else
        output += c 
      end
    end
    output
  end
  
  def test_cipher
  
    input_1 = 'Zebra-493?'
    expected_1 = 'Cheud-726?'
    if rotational_cipher(input_1, 3) != expected_1
      puts 'test doesnt pass with input #{input_1}'
    end
    
    input_2 = 'abcdefghijklmNOPQRSTUVWXYZ0123456789'
    expected_2 = 'nopqrstuvwxyzABCDEFGHIJKLM9012345678'
    if rotational_cipher(input_2, 39) != expected_2
      puts 'test doesnt pass with input #{input_2}'
    end
    
    input_3 = "All-convoYs-9-be:Alert1."
    rotationFactor_3 = 4
    expected_3 = "Epp-gsrzsCw-3-fi:Epivx5."
    if rotational_cipher(input_3, rotationFactor_3) != expected_3 
      puts 'test doesnt pass with input #{input_3}'
    end
  
    input_4 = "abcdZXYzxy-999.@"
    rotationFactor_4 = 200
    expected_4 = "stuvRPQrpq-999.@"
    if rotational_cipher(input_4, rotationFactor_4) != expected_4 
      puts 'test doesnt pass with input #{input_4}'
    end
    
  end
  test_cipher
  
  