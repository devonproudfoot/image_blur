class Image
  attr_accessor :image

  def initialize(data)
    @image = data
  end

  def blur
    # find each 1
    ones = []
    row_max = @image[0].length - 1
    column_max = @image.length - 1

    @image.each_with_index do |row, column|
      if row.include?(1)
        ones.push([row.index(1), column])
      end
    end

    ones.each do |one|
      # write individual if statements for each to make sure they do not go out of bounds?
      vert = one[1]
      horiz = one[0]

      unless vert == column_max
        @image[vert + 1][horiz] = 1
      end

      unless vert == 0
        @image[vert - 1][horiz] = 1
      end

      unless horiz == row_max
        @image[vert][horiz + 1] = 1
      end

      unless horiz == 0
        @image[vert][horiz - 1] = 1
      end
    end

    #combined blur and output image functions for simplicity of lesson!
    @image.each do |row|
      puts row.join
    end

  end

end