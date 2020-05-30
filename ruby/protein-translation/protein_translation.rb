=begin
Write your code for the 'Protein Translation' exercise in this file. Make the tests in
`protein_translation_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/protein-translation` directory.
=end

class Translation
  def self.of_codon(codon)
    codon_to_polypeptide = {
      AUG: :Methionine,
      UUU: :Phenylalanine,
      UUC: :Phenylalanine,
      UUA: :Leucine,
      UUG: :Leucine,
      UCU: :Serine,
      UCC: :Serine,
      UCA: :Serine,
      UCG: :Serine,
      UAU: :Tyrosine, 
      UAC: :Tyrosine,
      UGU: :Cysteine,
      UGC: :Cysteine,
      UGG: :Tryptophan,
      UAA: :STOP,
      UAG: :STOP,
      UGA: :STOP
    }

    return codon_to_polypeptide[codon.to_sym].to_s
  end

  def self.of_rna(rna_strand)
    protein_array = []
    i = 0
    codon = nil
    while i < rna_strand.length - 1 do
      codon = rna_strand.slice(i, 3)

      raise InvalidCodonError.new if self.of_codon(codon) == ""

      break if self.of_codon(codon.to_sym) == "STOP"
      protein_array.push(self.of_codon(codon)) 
      i = i + 3
    end
    return protein_array
  end

end

class InvalidCodonError < StandardError
  def initialize
    @exception_type = "Invalid Codon Error"
    super("The RNA strand contains an invalid codon")
  end
end

# def convert_RNA_string_to_protein_strings(rna_string)
#   codon_array = []
#   i = 0
#   codon = nil
#   while i < (rna_string.length - 1) do
#     codon = rna_string.slice(i, 3)
#     break if $codon_to_polypeptide[codon.to_sym] == :STOP
#     codon_array.push(codon) 
#     i = i + 3
#   end

#   protein_array = []
#   codon_array.each do |codon|
#     protein_array.push($codon_to_polypeptide[codon.to_sym])
#   end

#   return protein_array.join(" ")
# end

# convert_RNA_string_to_protein_strings("AUGUUUUCUUAAAUG")