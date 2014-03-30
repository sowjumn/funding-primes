class Decorator 
  attr_reader :row, :first, :row_length

  def initialize(row_length=nil)
    @row_length = row_length || 11
  end

  def print_row(row,first=nil)
    @row = row

    print_line_separator(first)
    print_box if first
    row.each { |r| print_box(r) }
    print "|\n"
  end

  def print_box(n=nil)
    digits = 0
    digits = calculate_digits(n) if n
   
    front_spacer = "|  "
    rear_spacer = " "*(8-digits)
    print "#{front_spacer}#{n}#{rear_spacer}"
  end

  def print_line_separator(first=nil)
    @row_length = @row_length + 1 if first
    num = 11*row_length 
    puts "-"*num
  end

  def calculate_digits(d)
    digits = 1
    while d/10 != 0
      digits = digits + 1
      d = d/10
    end
    digits
  end
end