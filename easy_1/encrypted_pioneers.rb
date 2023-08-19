=begin
A:
create an array containing each character.
create an empty string for the new string
iterate through the input string, and for each character:
  if the character is a space, add a space to the new string
  otherwise, get the index of that char in the array. (remember of upcased)
  add 13 to the index, and if over 26, subtract 26.
  get the letter at the new index, and add to string. (upcase if needed)
return the new string
=end

ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def decrypt_rot13(input_str)
  new_str = ''
  input_str.each_char do |char|
    upcased = false
    upcased = true if char.upcase == char
    char = char.downcase
    if !ALPHABET.include?(char)
      new_str << char
    else
      idx = ALPHABET.index(char.downcase) + 13
      idx -= 26 if idx > 25
      new_char = ALPHABET[idx].dup
      new_char.upcase! if upcased
      new_str << new_char
    end
  end
  new_str
end

ENCRYPTED_PIONEERS.each { |person| puts decrypt_rot13(person) }